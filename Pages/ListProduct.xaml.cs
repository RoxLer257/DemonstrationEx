using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using test.Classes;

namespace test.Pages
{
    /// <summary>
    /// Логика взаимодействия для ListProduct.xaml
    /// </summary>
    public partial class ListProduct : Page
    {
        public ListProduct()
        {
            Helper.PageName.Text = "СПИСОК ПРОДУКТОВ";
            InitializeComponent();
            this.Loaded += ListProduct_Loaded;
            LtvListMaterial.SelectionChanged += LtvListMaterial_SelectionChanged;
        }

        private void ListProduct_Loaded(object sender, RoutedEventArgs e)
        {
            LoadMaterialRequirements();
        }

        private void LoadMaterialRequirements()
        {
            // Загружаем все продукты из базы данных
            var products = Helper.ConnectDB.Products.ToList();
            // Для каждого продукта рассчитываем стоимость
            var productsWithCost = products.Select(p => new ProductWithCost
            {
                Product = p,
                TotalMaterialCost = CalculateProductCost(p)
            }).ToList();
            LtvListMaterial.ItemsSource = productsWithCost;
        }

        private double CalculateProductCost(Products product)
        {
            var materials = Helper.ConnectDB.Product_materials.Where(pm => pm.IDProduct == product.ID_Product).ToList();
            double cost = 0;
            foreach (var pm in materials)
            {
                if (pm.Materials != null && pm.NuzhnoQuantityMaterial.HasValue && pm.Materials.PriceEdMaterial.HasValue)
                {
                    cost += pm.NuzhnoQuantityMaterial.Value * pm.Materials.PriceEdMaterial.Value;
                }
            }
            return Math.Round(cost, 2);
        }

        public class ProductWithCost
        {
            public Products Product { get; set; }
            public double TotalMaterialCost { get; set; }
            // Проксируем свойства для биндинга
            public string NameProduct => Product.NameProduct;
            public string Articul => Product.Articul?.ToString();
            public string MinCostForPartner => Product.MinCostForPartner?.ToString();
            public string RollWidthMetr => Product.RollWidthMetr?.ToString();
            public Product_type Product_type => Product.Product_type;
            public int ID_Product => Product.ID_Product;
        }

        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new EditProduct(null));
        }

        private void LtvListMaterial_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (LtvListMaterial.SelectedItem is ProductWithCost selectedProduct)
            {
                NavigationService.Navigate(new EditProduct(selectedProduct.ID_Product));
            }
        }

        private void LtvListMaterial_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            btnEditProduct.IsEnabled = LtvListMaterial.SelectedItem is ProductWithCost;
        }

        private void btnEditProduct_Click(object sender, RoutedEventArgs e)
        {
            if (LtvListMaterial.SelectedItem is ProductWithCost selectedProduct)
            {
                NavigationService.Navigate(new EditProduct(selectedProduct.ID_Product));
            }
        }

        private void MaterialsButton_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button btn && btn.DataContext is ProductWithCost product)
            {
                NavigationService.Navigate(new ProductMaterials(product.ID_Product));
            }
        }
    }
}
