class Solution {
    public int countHillValley(int[] nums) {
        int res = 0; // no. of peaks and valleys
        int n = nums.length;
        for (int i = 1; i < n-1; ++i) {
            if (nums[i] == nums[i-1]) {
                // deduplication
                continue;
            }
            int left = 0; // left side possibly unequal neighbouring corresponding state
            for (int j = i-1; j >= 0; --j) {
                if (nums[j] > nums[i]) {
                    left = 1;
                    break;
                } else if (nums[j] < nums[i]) {
                    left = -1;
                    break;
                }
            }
            int right = 0; // right side possibly unequal neighbouring corresponding state
            for (int j = i+1; j < n; ++j) {
                if (nums[j] > nums[i]) {
                    right = 1;
                    break;
                } else if (nums[j] < nums[i]) {
                    right = -1;
                    break;
                }
            }
            if (left == right && left != 0) {
                // At this time, index 1 is part of a peak or valley
                ++res;
            }
        }
        return res;
    }
}