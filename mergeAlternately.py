class Solution(object):
    def mergeAlternately(self, word1, word2):
        """
        :type word1: str
        :type word2: str
        :rtype: str
        """
        len1 = len(word1)
        len2 = len(word2)
        merged = ''
        index = 0
        while(True):
            if index == len1 or index == len2:
                break
            merged += word1[index]
            merged += word2[index]
            index += 1

        if index < len1:
            for i in range(index, len1):
                merged += word1[i]
        elif index < len2:
            for i in range(index, len2):
                merged += word2[i]

        return merged