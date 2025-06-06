# Given an integer array nums and an integer target, find indices i and j such that nums[i] + nums[j] == target and i != j.
# Assume that every input has exactly one pair of indices i and j that fulfill this condition.
# Return the pair of indices with the smaller index first.

# Example 1:
# Input: nums = [1, 2, 3, 4], target = 5
# Output: [0, 3]
# Explanation: nums[0] + nums[3] == 5, so we return [0, 3].

# Example 2:
# Input: nums = [0, -1, 2, -3, 1], target = -2
# Output: [1, 3]

# Constraints:
# 2 <= nums.length <= 10³
# −10⁷ <= nums[i] <= 10⁷
# −10⁷ <= target <= 10⁷

# Brute Force - O(n²)
class Solution
  def self.two_sum(nums = [], target = 0)
    return if (nums.size < 2 || nums.size >= 10**3) || (target <= -10**7 || target >= 10**7)

    for i in 0..(nums.size-2) do
      for j in (i+1)..(nums.size-1) do
        return nil if (nums[i] <= -10**7 || nums[i] >= 10**7)

        return [i, j] if nums[i] + nums[j] == target
      end
    end

    return []
  end
end

# Optimized - O(n^2)
class Solution
  def self.two_sum(nums = [], target = 0)
    nums.each_with_index do |num, i|
      if val = nums.index(target - num)
        return [i, val]
      end
    end
    return []
  end
end

# Optimized - O(n)
class Solution
  def self.two_sum(nums = [], target = 0)
    hash = {}
    nums.each_with_index do |num, i|
      complement = target - num
      return [hash[complement], i] if hash.key?(complement)
      hash[num] = i
    end
    return []
  end
end

Solution.two_sum([1,2,3,4,5], 9)
