class Solution(object):
    def romanToInt(self, s):
        """
        :type s: str
        :rtype: int
        """

        val = 0
        i = 0
        chars = len(s)

        while True:
            if i >= chars:
                return val 

            if s[i] == 'I':
                if i+1 == chars:
                    val += 1
                elif s[i+1] == 'V':
                    val += 4
                    i += 1
                elif s[i+1] == 'X':
                    val += 9
                    i += 1
                else:
                    val += 1

            elif s[i] == 'V':
                val += 5

            elif s[i] == 'X':
                if i+1 == chars:
                    val += 10
                elif s[i+1] == 'L':
                    val += 40
                    i += 1
                elif s[i+1] == 'C':
                    val += 90
                    i += 1
                else:
                    val += 10

            elif s[i] == 'L':
                val += 50

            elif s[i] == 'C':
                if i+1 == chars:
                    val += 100
                elif s[i+1] == 'D':
                    val += 400
                    i += 1
                elif s[i+1] == 'M':
                    val += 900
                    i += 1
                else:
                    val += 100
            
            elif s[i] == 'D':
                val += 500

            elif s[i] == 'M':
                val += 1000
            
            i += 1
