#!/usr/bin/perl

# create diagrams with the rst package in LaTeX from URML
# args: urml2latex  -i xmlfile docid analysis-id
 
 
 # change this for relname replacements
 sub replace_relname($)
 {
 	my $rel = $_[0];
 	
 	$rel =~ s/evaluation/eval/i;
 	$rel =~ s/elaboration/elab/i;
 	$rel =~ s/object/obj/i;
 	$rel =~ s/attribute/attr/i;
 	$rel =~ s/additional/addl/i;
 	return $rel;
 }
 
@args = ();
$putSegmentsInTree=0;
foreach(@ARGV)
{
	if (/\-i/i)
	{
		$putSegmentsInTree=1;
	} else
	{
		push @args, $_;
	}
}

$fn =  $args[0];

unless($fn)
{
	print "Converts a fully specified URML analysis to LaTeX rst format.\nUsage: urml2latex [-i]  xmlfile [docid [analysis-id]]\n";
	exit;
}
warn "loading $fn\n";

{
	local(*INPUT, $/);
	open (INPUT, $fn) 	|| die "can't open $fn: $!";
	$f = <INPUT>;
	close INPUT;
}  

$docid = $args[1];
$anaid = $args[2];

if ($docid eq '')
{

print "printing all document ids: \n";
 
while ($f =~ /\<document\s+id\s*=\s*(\"?)([^\">]+)(\"?)\s*>/isg)
{
	print $2."\n";
}

} else
{
	 
	unless ($f =~ /<document\s+id\s*=\s*(\"?)$docid(\"?)\s*>(.*?)<\s*\/\s*document\s*>/is)
	{
		die "Document $docid not found.";
		
	}
	
	
	$doc = $3;
	
	
	
	$docid =~ s/_//g;
	
	# more than one analysis?
	my $mdoc;
	
	%ana = ();
	while ($doc =~/<analysis\s+id\s*=\s*(\"?)(.*?)(\"?)\s*>(.*?)<\/\s*analysis\s*>/isg)
	{
		$ana{$2} = $4;
		
	}
	if (scalar keys %ana >1)
	{ 
		if ($anaid && exists($ana{$anaid}))
		{
			$mdoc = $ana{$anaid};
		} else
		{
			print "Please specify the analysis of this document as argument. Printing all available analyses:\n";
			
			foreach (keys %ana)
			{
				print $_."\n";
			}
			exit;
			
		}
	
	} else
	{
		$mdoc = $doc;
	} 
	print $mdoc;
	print "% rhetorical diagram\n";
	
	# store all relations in a hash
	
	 
	while ($mdoc =~ /<\s*(relation|hypRelation|parRelation|segment)\s*(.*?)>(.*?)<\s*\/\1\s*>/isg)
	{
		my $relclass = $1;
		my $relattr = $2;
		my $relcontent = $3;
	

		if ($relattr =~ /id\s*=\s*\"(.+?)\"/)
		{
			my $relid = $1;
			
				# check relation
			if ($relclass eq 'hypRelation' && !($relcontent =~ /<\s*nucleus/is))
			{
				warn "Node $relid is a $relclass, but has no nucleus -- ignoring that node!";
			} else
			{
			
				$relid =~ s/_//g;
				
				$relsxml{$relid} = $relcontent;
				$relclass{$relid} = $relclass;
				  
				if ($relattr =~ /type\s*\=\s*\"(.*?)\"/is)
				{
					$reltype{$relid} = &replace_relname($1);
				}
				if ($relattr =~ /group\s*=\s*\"(.*?)\"/is)
				{
					$relgroup{$relid} = $1;
				}
			
			
			}
			
			
		}	
	}
	
	# bottom-up approach, start with segment

	# assign labels
	foreach(keys %relclass)
	{
		if ($relclass{$_} eq 'segment')
		{
			if ($putSegmentsInTree)
			{
				$rellatex{$_} = '\rstsegment{'.&conv_text($relsxml{$_}).'}';
			} else
			{
				$rellatex{$_} = "\\rstsegment{\\refr{$_}}";
			}
			$complete{$_} = 1;
		} else
		{
			$rellatex{$_} = $relsxml{$_};
			$complete{$_} = 0;
		}
		
	}
	
	# there is no top node, so we need to expand nodes sucessively. 
	 
	 while(1)
	 {
	 	my $nodescompleted=0;  # success count
	 	my $uncompletenodes=0;  # number of non-complete nodes in the chart
	 
		foreach(keys %relclass)
		{
		# 	if ($relclass{$_} eq 'segment')
	# 		{
	# 			my @parents = ();
	# 			getParents($relid, \@parents);
	# 		
	# 		}
	my $id = $_;
	  $rt = $reltype{$_}; 
	  $rc = $relclass{$_};
			#only un-complete nodes
			unless ($complete{$id})
			{
				
				$parentcomplete=1;
				#print "before: $rellatex{$id} \n";
				$rellatex{$id} =~ s/(<(satellite|nucleus|element)\s*(.*?)>)/&replaceDaughter($1,$2,$3);/isge;
	#print "after: $rellatex{$id} \n";
	
	$rellatex{$id} =~ s/^\s+//sg;
	$rellatex{$id} =~ s/\s+$//sg;
	
				if ($parentcomplete)  # is complete after conv. of XML to LaTeX code
				{
					if ($rc eq 'hypRelation')
					{
						$rellatex{$id} = '\dirrel'.$rellatex{$id} ;
					} elsif ($rc eq 'parRelation')
					{
						$rellatex{$id} = '\multirel{'.$rt.'}'.$rellatex{$id} ;
					} else
					{
						warn "unspecified relation type: <relation> tag used!";
						$rellatex{$id} = '\multirel'.$rellatex{$id} ;
					}
					$complete{$id} = 1;
					$nodescompleted++;
				}
				$uncompletenodes++;
			}
		
			
		}
		print "uncomp: $uncompletenodes         compl: $nodescompleted\n";
		last if ($uncompletenodes == 0);
		if ($nodescompleted == 0)
		{
			warn "Not all nodes could be transformed to tree nodes -- circularities or undefined but referenced nodes in graph structure?\nPrinting largest existing analysis!"; 
last;
		}
		
	}
	
	 
	 #find biggest tree (with most nodes)
	 
	my $maxnodes=0;
	my $largestnode = '';
	foreach(keys %relclass)
	{
		if ($complete{$_})
		{
			#count nodes
			
			my $nodes = 0;
			while($rellatex{$_} =~ /\\(dir|multi)rel/isg)
			{
				$nodes++;
			}
			if ($nodes > $maxnodes)
			{
				$maxnodes = $nodes;
				$largestnode = $_;
			}
		}
	}
	 
	 if($largestnode)
	 {
	 	print $rellatex{$largestnode};
	 } else
	 {
	 	warn "could not find largest node!";
		foreach(keys %relclass)
		{
			if ($complete{$_})
			{
				print $rellatex{$_}."\n\n";
			}
			
		}
	 }
	 
	print "\n\n";
	
	&pr_corpustext unless ($putSegmentsInTree);
	 
	exit;
	
	

}

sub replaceDaughter($$$$$)
{
	my $tag = $1;		 
	my $role = $2;
	my $attr = $3;
#	my $rc = $4;  must be passed down as global vars
#	my $rt = $5;
	
	#print "replace daughter tag=$tag role=$role attr=$attr \n";
	 
	
	if ($attr =~ /id\s*=\s*\"(.*?)\"/is)
	{
		my $did = $1;  # daughter id
		$did =~ s/_//g;
		if ($complete{$did})
		{
			my $text = "";
			
			if ($rc eq 'hypRelation')
			{
				if ($role eq 'satellite')
				{
					$text .= '{'.$rt.'}';
				} else
				{
					$text .= '{}';
				}
				
			} else
			{
				$text .= '';
			}		
			 
			return $text.'{'.$rellatex{$did}.'}';
		}
	}
 
	$parentcomplete=0;  # parent is not complete because XML code returned
	return $tag;
}
# 
# sub getParents($$)
# {
# 	my \@parents = $_[1];
# 	my $id = $_[0];
# 	foreach(keys %relclass)
# 	{
# 		if ($relcontent =~ /id\s*=\s*\"$id\"/)
# 		{
# 			push @parents, $id;
# 		}
# 	}
# 	
# }


sub pr_corpustext 
{

print '\begin{rhetoricaltext}'."\n";
while($doc =~ /<segment\s+id\s*=\s*(\"?)([^\">]+)(\"?)[^>]*>(.*?)<\/\s*segment\s*>/isg )
{
	my $segid = $2;
	my $seg = $4;
	 
	#$segid =~ s/$docid\.?//;
	 $segid =~ s/_//g;
	 
	
	 $seg = &conv_text($seg);
	 

	if ($seg)
	{ print "\\unit[$segid]{$seg}\n";
	}
}
print '\source{'."$docid}".'\end{rhetoricaltext}'."\n";
return;

}


sub conv_text ($)
{
my $seg = $_[0];

 $seg =~ s/\<\/?sign[^>]*>//isg;
	 
	$seg =~ s/(Ä|\&Auml;)/\\\"\{A\}/sg;
	$seg =~ s/(Ö|\&Ouml;)/\\\"\{O\}/sg;
	$seg =~ s/(Ü|\&Uuml;)/\\\"\{U\}/sg;
	$seg =~ s/(ä|\&auml;)/\\\"\{a\}/sg;
	$seg =~ s/(ö|\&ouml;)/\\\"\{o\}/sg;
	$seg =~ s/(ü|\&uuml;)/\\\"\{u\}/sg;
	$seg =~ s/(ß|\&szlig;)/\\\"\{ss\}/sg;
	$seg =~ s/\$/\\\$/sg;
	return $seg;
}
