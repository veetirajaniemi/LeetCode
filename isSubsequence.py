class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """

        nChars = len(s)
        ind = 0

        if len(s) == 0:
            return True

        if len(s) > len(t):
            return False

        for i in range(len(t)):
            if t[i] == s[ind]:
                ind += 1
                if ind == nChars:
                    return True
        return False