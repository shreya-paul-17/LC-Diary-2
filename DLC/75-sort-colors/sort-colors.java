class Solution {
    public void sortColors(int[] nums) {
        // Dutch National Flag Algo
        int low=0, mid=0, high=nums.length-1;

        while(mid<=high) {
            if(nums[mid] == 0) {
                // swap low to mid
                int temp=nums[low];
                nums[low]=nums[mid];
                nums[mid]=temp;

                low++; // increment both the pointers
                mid++;
            } else if(nums[mid] == 1) {
                mid++;
            } else {
                // swap mid and high
                int temp=nums[mid];
                nums[mid]=nums[high];
                nums[high]=temp;

                high--; // decrement the high pointer
            }
        }
    }
}