
  // Dummy data for categories
  import 'category_model.dart';

List<Category> dummycategories = [
    Category(
      id: '1',
      name: 'All',
      items: [
        Item(
          id: '1.1',
          name: 'Smartphone',
          image: 'https://example.com/smartphone.jpg',
          subitems: [
            Subitem(
              id: '1.1.1',
              name: 'iPhone 14',
              image: 'https://example.com/iphone14.jpg',
              subitems: [
                Subitem(
                  id: '1.1.1.1',
                  name: 'iPhone 14 Pro Max',
                  image: 'https://example.com/iphone14promax.jpg',
                  subitems: [],
                ),
                Subitem(
                  id: '1.1.1.2',
                  name: 'iPhone 14 Mini',
                  image: 'https://example.com/iphone14mini.jpg',
                  subitems: [],
                ),
              ],
            ),
            Subitem(
              id: '1.1.2',
              name: 'Samsung Galaxy S22',
              image: 'https://example.com/samsunggalaxy.jpg',
              subitems: [
                Subitem(
                  id: '1.1.2.1',
                  name: 'Samsung Galaxy S22 Ultra',
                  image: 'https://example.com/galaxys22ultra.jpg',
                  subitems: [],
                ),
              ],
            ),
          ],
        ),
        Item(
          id: '1.2',
          name: 'Clothing',
          image: 'https://example.com/clothing.jpg',
          subitems: [
            Subitem(
              id: '1.2.1',
              name: 'T-Shirts',
              image: 'https://example.com/tshirt.jpg',
              subitems: [
                Subitem(
                  id: '1.2.1.1',
                  name: 'Nike T-Shirt',
                  image: 'https://example.com/niketshirt.jpg',
                  subitems: [],
                ),
                Subitem(
                  id: '1.2.1.2',
                  name: 'Adidas T-Shirt',
                  image: 'https://example.com/adidastshirt.jpg',
                  subitems: [],
                ),
              ],
            ),
            Subitem(
              id: '1.2.2',
              name: 'Jeans',
              image: 'https://example.com/jeans.jpg',
              subitems: [
                Subitem(
                  id: '1.2.2.1',
                  name: 'Levi\'s Jeans',
                  image: 'https://example.com/levisjeans.jpg',
                  subitems: [],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    Category(
      id: '2',
      name: 'Electronics',
      items: [
        Item(
          id: '2.1',
          name: 'Laptops',
          image: 'https://example.com/laptop.jpg',
          subitems: [
            Subitem(
              id: '2.1.1',
              name: 'MacBook Air',
              image: 'https://example.com/macbookair.jpg',
              subitems: [
                Subitem(
                  id: '2.1.1.1',
                  name: 'MacBook Air M1',
                  image: 'https://example.com/macbookm1.jpg',
                  subitems: [],
                ),
                Subitem(
                  id: '2.1.1.2',
                  name: 'MacBook Air M2',
                  image: 'https://example.com/macbookm2.jpg',
                  subitems: [],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    Category(
      id: '3',
      name: 'Toys',
      items: [
        Item(
          id: '3.1',
          name: 'Action Figures',
          image: 'https://example.com/actionfigures.jpg',
          subitems: [
            Subitem(
              id: '3.1.1',
              name: 'Superman Action Figure',
              image: 'https://example.com/superman.jpg',
              subitems: [],
            ),
            Subitem(
              id: '3.1.2',
              name: 'Batman Action Figure',
              image: 'https://example.com/batman.jpg',
              subitems: [],
            ),
          ],
        ),
      ],
    ),
    Category(
      id: '4',
      name: 'Fruits',
      items: [
        Item(
          id: '4.1',
          name: 'Apple',
          image: 'https://example.com/apple.jpg',
          subitems: [
            Subitem(
              id: '4.1.1',
              name: 'Red Apple',
              image: 'https://example.com/redapple.jpg',
              subitems: [],
            ),
            Subitem(
              id: '4.1.2',
              name: 'Green Apple',
              image: 'https://example.com/greenapple.jpg',
              subitems: [],
            ),
          ],
        ),
      ],
    ),
  ];

  // // Print out the categories
  // for (var category in categories) {
  //   print('Category: ${category.name}');
  //   for (var item in category.items) {
  //     print('  Item: ${item.name}');
  //     for (var subitem in item.subitems) {
  //       print('    Subitem: ${subitem.name}');
  //       for (var nestedSubitem in subitem.subitems) {
  //         print('      Nested Subitem: ${nestedSubitem.name}');
  //       }
  //     }
  //   }
  // }

