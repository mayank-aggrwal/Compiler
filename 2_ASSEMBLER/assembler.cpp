#include <bits/stdc++.h>
using namespace std;

int main() {

    string s = "mayan      ,duisisdgstryeuwewiwieyw", tmp;
    stringstream ss(s);
    while(getline(ss, tmp, ',')) {
        if(tmp == "") {
            continue;
        }
        cout << tmp << " =\n";
    }

}