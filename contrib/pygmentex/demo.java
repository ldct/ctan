import java.io.IOException;
import java.io.Reader;
import java.util.Hashtable;
import java.util.Map;

public class Lexer
{
   private Reader in;
   private int x;
   
   private Map<String,Token.T> reserved =
      new Hashtable<String,Token.T>();
   
   public Lexer(Reader in) throws IOException
   {
      this.in = in;
      x = in.read();
      reserved.put("let", Token.T.LET);
      // acrescentar demais palavras reservadas
      // ...
   }

   public Token get() throws IOException
   {
      // retornar o próximo símbolo léxico do programa
      
      while (Character.isWhitespace(x))
         x = in.read();

      if (x == -1)
         return new Token(Token.T.EOF);
      
      if ((char)x == ',')
      {
         x = in.read();
         return new Token(Token.T.COMMA);
      }

      if (Character.isDigit(x))
      {
         StringBuilder builder = new StringBuilder();
         builder.append((char)x);
         while (Character.isDigit((x = in.read())))
            builder.append((char)x);
         return new Token(Token.T.INT, new Long(builder.toString()));
      }

      if (Character.isAlphabetic(x))
      {
         StringBuilder builder = new StringBuilder();
         builder.append((char)x);
         while (Character.isAlphabetic(x = in.read()) ||
                Character.isDigit(x) || (char)x == '_')
            builder.append((char)x);
         String s = builder.toString();
         Token.T t = reserved.get(s);
         if (t == null)
            return new Token(Token.T.ID, s);
         return new Token(t);
      }

      // completar demais tokens
      
      System.out.println("unexpectec char: <" + (char)x + ">");
      x = in.read();
      return get();
   }
}
