"""
proshap.py v. 1.1

Desc:
Rasterizer for producing shapes useful for the LaTeX package
shapepar. It's a python script. www.python.org.


Copyright Manuel Gutierrez Algaba January 2003
All rights reserved. 
Released under GPL license.

Contact: algaba@gmx.net

Changes: 
1.1 : New  {10}{0}b{5.6} command, automatic now. 
1.1 : New copyright notice

known Bugs:

 Watch when have  two forks at the same line. Example:
 --------------------------------------------
 -----         ---------------        --------

Solution: Increase the resolution (number of lines and height) and
don't put the two forks at the same line.

It _may_ fail a 'bit'.

"""

import string

test1 = """
                3333
            33333333333
          33333333333333  
        3333333333333333 
                333333
               333333  
             3333333  
            3333333 
             3333333                    3333                
              3333333                 33333333
               3333333              33333333333           3
                3333333           333333   33333        33 
                  333333         333333     33333     3333 
                   333333       333333       33333   3333
                    33333333333333333         3333333333
                     33333333333333            33333333  
"""

test3 = """  
                   33333333333333333
             33333333333333333333333333333         
           333333333333333333333333333333333
          33333333333333333333333333333333333
         3333333333333333333333333333333333333
         333333         3333333          333333
         33333           33333            33333 
         333333         3333333          33333
         33333333333333333   33333333333333333
          333333333333333     333333333333333
           3333333333333       3333333333333
            333333333333333333333333333333
             3333333333333333333333333333
              33                     333
               333333         333333333
                3333333333333333333333       
"""

test4 =  """
                    33
                  333333
                 33333333 
                3333333333 
               333333333333
                 33333333 
             3333333333333333
                   3333
                   3333 
"""


test5 =  """

                           333333333333333333333
                          3333333333333333333333
                           33333333333      3333
                             3333333         333
                            33333333           
                          33333333333
          3333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333
          33333          333333333               3333333
          333             3333333                  33333
          33            33333333333                  333
          3           3333333333333333                33
       
"""

test6 = """
3
333
333333333
  333333333333
    33333333333333333
       33333333333333333
          33333333333333333
            33333333333333333
        333333333333333333
     3333333333333333333
   3333333333333333333
    33333333333333333333
  33333333333333333    
"""

test7 = """

   3333  33333    333333       333    33
  333333333333   333  333     33 33  33 
 333  333   333 333 33  333  333  3333
3333       33333333     333333     33


"""
test8 = """

        33333333333333333333333333333333
           33333333333333333333333333
           33333                33333
          3333333              3333333
         333333333            333333333
         333333333            333333333
          3333333              3333333
           33333333333333333333333333  
"""

test9 = """
333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333
                      33333333333333333333333333333333333333
                            33333333333333333333333333333333
                                       333333333333333333333
                                           33333333333333333
                                           33333333333333333
                                           33333333333333333
                                       333333333333333333333
                            33333333333333333333333333333333
                     333333333333333333333333333333333333333
              3333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333  
"""
test10 = """
       3
       3
       3
     33333
    3333333
      333
       3
       3
"""
    
test11 = """

  3
  3333
 333
33 
"""

test12 = """
3333          3333         3333            3333
33333        333333       333333          33333
3333333    333333333    3333333333       333333
33333333333333333333333333333333333333333333333
"""
test = test3
list_of_lines = string.split(test,"\n")

def detect_start(line, index = 0):
    """
    line : not containing \n
    """
    c = index
    for i in line:
        if i!=" ":
            return c
        c = c +1
    return None

def detect_end(line, index):
    """
    line : not containing \n
    """
    c = index
    for i in line: 
        if i==" " :
            break
        c = c + 1
    return c

def generate(current, last):
    """
    current, last : list of segments, perhaps requiring a 
    join or a split

    """
    for i in xrange(0,len(current)):
        if i == len(current) -1:
            break
        for j in last:
            if j.overlaps(current[i], current[i+1]):
                j.make_joint()
                #print "o"

    for i in xrange(0,len(last)):
        if i == len(last) -1:
            break
        for j in current:
            if j.splits(last[i], last[i+1]):
                #print "s"
                j.make_split()

class segment:
    def __init__(self, start, end, number ):
        self._start = start
        self._end = end
        self._split = 0
        self._joint = 0
        self._numberofline = number

    def get_no_line(self):
        return self._numberofline

    def make_height(self, h):
        self._height = h

    def make_joint(self):
        self._joint = self._joint + 1

    def make_split(self):
        self._split = self._split + 1

    def overlaps(self, seg1, seg2):
        """
        This segment is the 'father' of seg1 , seg2 , See drawing:
             --------------------            <-- seg this
          ---------            --------     <-- seg1 and seg2
        """
        return seg1._end > self._start and seg2._start < self._end

    def splits(self, seg1, seg2):
        """
        This segment is the 'son' of seg1 , seg2 , See drawing:
          ---------            --------     <-- seg1 and seg2
             --------------------            <-- seg this
        """
        return seg1._end > self._start and seg2._start < self._end

    def generate_line(self, factor, heading = None):
        dev = ""
        if not heading is None :
            dev = dev + "{"+ str(self._height)+ "}" 
        dev = dev +"t{"
        l = self._end - self._start 
        l = l * factor
        if self._split:
            c = "j"
        else:
            c = "s"
        if self._split or self._joint:
            a = self._split + self._joint # one of them will be 0
            div_f = a + 1.0
            dev = dev + str(self._start* factor) + "}{" + str(l/div_f) + \
                  "}"
            for i in xrange(0,a):
                dev = dev + c+ "t{"+ \
                      str(self._start* factor + (i+1)*l/div_f)+ \
                      "}{" +  str(l/div_f) +"}"
        else:
            dev = dev = dev + str(self._start* factor) + "}{" + str(l)+ "}"
        return dev

list_of_segments = []
last_line_segments = []
current_line_segments = []

numberofline = 0
for i in list_of_lines:    
    numberofline = numberofline + 1
    s = detect_start(i)
    if s is None:
        continue
    e = detect_end(line = i[s:], index = s)
    while 1:
        #print s,e
        current_line_segments.append(segment(s,e, numberofline))
        s = detect_start(line = i[e:], index = e)
        if s is None:
            break
        e = detect_end(line = i[s:], index = s)

    generate(current_line_segments, last_line_segments)
    list_of_segments = list_of_segments + current_line_segments
    last_line_segments = current_line_segments
    current_line_segments =[]

each_char = 0.4
height = 0   
inc_height = 0.8
numberofline = -1

#{20}{0}b{1.6}
result = ""
max = -1 
for i in list_of_segments:
    if i._end > max:
        max = i._end
    i.make_height(height)
    height = height + inc_height
    nl= i.get_no_line() 
    if nl != numberofline:
        numberofline = nl
        result = result +  "\\\\"
        result = result + i.generate_line(each_char,heading = 1) + "\n"
    else:
        result = result + i.generate_line(each_char) + "\n"

height = height + inc_height

# str(list_of_segments[0]._start)
middle = str(each_char *max/2.0)

result = "\\gdef\\bassshape{{"+ middle  + \
         "}{0}b{"+ middle +"}\n"  + result


result = result+ "\\\\{"+str(height) +"}e{"+ middle +"}" + "}\n" 
print result
f = open("result.tex","w")
f.write(result)
f.close()       


