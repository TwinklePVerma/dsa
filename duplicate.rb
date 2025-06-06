# Given an integer array nums, determine whether any element appears more than once. Return true if a duplicate exists, and false otherwise.

# Example 1:
# Input: nums = [1, 1, 2, 3]
# Output: true

# Example 2:
# Input: nums = [1, 2, 3, 4]
# Output: false

# Constraints:
# 2 <= nums.length <= 10³
# −10⁷ <= nums[i] <= 10⁷

# Interview Recommendation:
# Aim to create a solution that has O(n) time and space complexity

# Brute Force - O(n^2)
class Solution
  def self.hasDuplicate(nums = [])
    cpy = nums
    nums.each_with_index do |v, i|
      cpy[i] = nil
      return true if cpy.include?(v)
    end

    return false
  end
end

# Optimize - O(n)
class Solution
  def self.hasDuplicate(nums = [])
    seen = Set.new
    nums.each do |v|
      return true if seen.include?(v)
      seen.add(v)
    end

    return false
  end
end

Solution.hasDuplicate([1, 1, 2, 3])


Note:
# Set.include? is faster than Array.include?
