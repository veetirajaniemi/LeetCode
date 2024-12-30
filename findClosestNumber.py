class Solution(object):
    def findClosestNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        mindist = 100001
        minnum = mindist

        for num in nums:
            dist = abs(num)
            if dist < mindist:
                minnum = num
                mindist = dist
            elif dist == mindist:
                if num > minnum:
                    minnum = num
        
        return minnum