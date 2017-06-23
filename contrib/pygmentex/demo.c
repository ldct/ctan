// test.cpp

#include <iostream>

using namespace std;

void greetings()
{
   string name;
   cout << "What is your name? ";
   cin >> name;
   cout << "Hello, "
	<< name
	<< '!'
	<< endl;
}

int main()
{
   greetings();
   return 0;
}
