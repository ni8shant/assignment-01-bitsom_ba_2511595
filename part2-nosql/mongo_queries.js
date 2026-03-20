// OP1: insertMany() — insert all 3 documents from sample_documents.json

db.products.insertMany([
{
  "product_id": "12345",
  "name": "HP Omnibook 5 Laptop",
  "category": "Electronics",
  "price": 63999,
  "brand": "HP",
  "specification": {
    "processor": "Snapdragon X",
    "ram": "16GB",
    "storage": "512GB SSD",
    "display": "14 inch FHD",
    "battery": "10 hours",
    "operating_system": "Windows 10",
    "warranty": "1 year",
    "color": "Silver",
    "weight": "1.2 kg",
    "resolution": "4K UHD"
  },
  "features": {
    "Backlit Keyboard": "Yes",
    "Fingerprint Sensor": "Yes",
    "HD Webcam": "Yes",
    "Wi-Fi 6": "Yes",
    "Bluetooth 5.0": "Yes",
    "MS Office 1 year": "Yes",
    "60Hz Refresh Rate": "Yes"
  },
  "customer_reviews": {
    "rating": 4.5,
    "reviewer": "Amit K.",
    "comment": "Great performance and build quality"
  }
},

{
  "product_id": "M001",
  "name": "Men's Cotton T-Shirt",
  "category": "Clothing",
  "price": 1999,
  "brand": "Turtle",
  "sizes_available": ["S","M","L","XL"],
  "color_options": ["Black","White","Blue"],
  "specification": {
    "fabric": "100% Cotton",
    "fit": "Regular Fit",
    "neckline": "Round Neck"
  },
  "features": {
    "Machine Washable": "Yes",
    "Moisture Wicking": "Yes",
    "UV Protection": "Yes"
  },
  "customer_reviews": {
    "rating": 4.4,
    "reviewer": "Rajesh M.",
    "comment": "Comfortable and well-made"
  }
},

{
  "product_id":"G301",
  "name":"Organic Almonds 500g",
  "category": "Groceries",
  "price": 800,
  "brand":"Nature's Best",
  "manufacturing_date": "2024-09-15",
  "expiry_date": "2025-03-15",
"specification": { "weight": "500g", "origin": "Shimla, Himachal Pradesh", "certification": "FSSAI Certified", "shelf_life": "6 months" },
    "nutritional_info": { "calories_per_100g": 575, "protein_g": 21, "fat_g": 49 },
    "storage_instructions": "Store in a cool and dry place",
    "pack_sizes": ["250g", "500g", "1kg"],
    "health_benefits": ["High in Vitamin E", "Good source of magnesium", "Supports heart health", "Low glycemic index"]
  }
]);


// OP2: find() — retrieve all Electronics products with price > 20000
db.products.find({
    "category": "Electronics",
    "price": { $gt: 20000 }
});

// OP3: find() — retrieve all Groceries expiring before 2025-01-01
db.products.find({
    "category": "Groceries",
    "expiry_date": { $lt: "2025-01-01" }
});

// OP4: updateOne() — add a "discount_percent" field to a specific product
db.products.updateOne(
    { "product_id": "12345" },
    { $set: { "discount_percent": 10 } }
);

// OP5: createIndex() — create an index on category field and explain why
db.products.createIndex({ "category": 1 });