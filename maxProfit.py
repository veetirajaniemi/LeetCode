class Solution(object):
    def maxProfit(self, prices):
        """
        :type prices: List[int]
        :rtype: int
        """

        if len(prices) <= 1:
            return 0

        buyPrice = prices[0]
        sellPrice = 0
        maxProfit = 0

        for i in range(1, len(prices)):
            if prices[i] > sellPrice:
                sellPrice = prices[i]
                profit = sellPrice - buyPrice
                if profit > maxProfit:
                    maxProfit = profit
            if prices[i] < buyPrice and i < len(prices):
                buyPrice = prices[i]
                sellPrice = 0
        
        return maxProfit
