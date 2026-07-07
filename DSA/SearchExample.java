public class SearchExample {
    public static Product linearSearch(Product[] products, int targetId) {
        for (int i = 0; i < products.length; i++) {
            if (products[i].productId == targetId) {
                return products[i];
            }
        }
        return null;
    }
    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0;
        int right = products.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;

            if (products[mid].productId == targetId) {
                return products[mid]; 
            }
            if (products[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return null; 
    }

    public static void main(String[] args) {
        Product[] products = {
            new Product(104, "Laptop", "Electronics"),
            new Product(101, "Shoes", "Fashion"),
            new Product(103, "Book", "Education"),
            new Product(102, "Mobile", "Electronics")
        };
        Product[] sortedProducts = {
            new Product(101, "Shoes", "Fashion"),
            new Product(102, "Mobile", "Electronics"),
            new Product(103, "Book", "Education"),
            new Product(104, "Laptop", "Electronics")
        };

        int searchId = 103;

        Product result1 = linearSearch(products, searchId);
        System.out.println("Linear Search Result: " + (result1!= null? result1 : "Not Found"));

        Product result2 = binarySearch(sortedProducts, searchId);
        System.out.println("Binary Search Result: " + (result2!= null? result2 : "Not Found"));
    }
}
