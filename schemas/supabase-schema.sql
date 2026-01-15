-- ============================================
-- OPTIZON - Amazon Product Research Database
-- Supabase PostgreSQL Schema
-- ============================================

-- Amazon Products Table (Main product data from Keepa)
CREATE TABLE IF NOT EXISTS amazon_products (
  id BIGSERIAL PRIMARY KEY,
  research_id TEXT UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  
  -- Identifiers
  asin TEXT,
  parent_asin TEXT,
  upc TEXT,
  ean TEXT,
  mpn TEXT,
  model TEXT,
  part_number TEXT,
  
  -- Product Info
  binding TEXT,
  product_group TEXT,
  product_type TEXT,
  color TEXT,
  size TEXT,
  format TEXT,
  edition TEXT,
  platform TEXT,
  
  -- URLs & Images
  url TEXT,
  url_slug TEXT,
  image_url TEXT,
  all_images JSONB,
  image_count INTEGER,
  
  -- Content
  title TEXT,
  description TEXT,
  features JSONB,
  feature_count INTEGER,
  
  -- Brand Info
  brand TEXT,
  brand_store_name TEXT,
  brand_store_url TEXT,
  manufacturer TEXT,
  label TEXT,
  publisher TEXT,
  studio TEXT,
  author TEXT,
  contributors JSONB,
  
  -- Categories
  root_category TEXT,
  category_tree JSONB,
  categories JSONB,
  sub_categories JSONB,
  
  -- Sales Rank (BSR)
  sales_rank_reference INTEGER,
  current_bsr INTEGER,
  all_category_bsr JSONB,
  bsr_change_30d INTEGER,
  bsr_change_90d INTEGER,
  bsr_growth_30d NUMERIC,
  bsr_growth_90d NUMERIC,
  
  -- Pricing
  amazon_price NUMERIC,
  new_price NUMERIC,
  used_price NUMERIC,
  list_price NUMERIC,
  collectible_price NUMERIC,
  refurbished_price NUMERIC,
  new_fbm_shipping NUMERIC,
  fba_price NUMERIC,
  buy_box_price NUMERIC,
  warehouse_price NUMERIC,
  ebay_new_price NUMERIC,
  ebay_used_price NUMERIC,
  price_history_30d JSONB,
  price_history_90d JSONB,
  
  -- Promotions
  coupon JSONB,
  coupon_history JSONB,
  promotions JSONB,
  
  -- Sales Data
  monthly_sold INTEGER,
  monthly_sold_history JSONB,
  monthly_sales_growth NUMERIC,
  estimated_revenue NUMERIC,
  
  -- Reviews & Ratings
  rating NUMERIC,
  review_count INTEGER,
  newly_ratings_30d INTEGER,
  newly_ratings_90d INTEGER,
  rating_history JSONB,
  review_count_history JSONB,
  
  -- Offers
  amazon_offer_count INTEGER,
  new_offer_count INTEGER,
  used_offer_count INTEGER,
  collectible_offer_count INTEGER,
  refurbished_offer_count INTEGER,
  fba_offer_count INTEGER,
  fbm_offer_count INTEGER,
  
  -- Variations
  variation_count INTEGER,
  variations JSONB,
  variation_attributes JSONB,
  
  -- Package Dimensions
  package_weight_grams NUMERIC,
  package_height_mm NUMERIC,
  package_length_mm NUMERIC,
  package_width_mm NUMERIC,
  package_weight_kg NUMERIC,
  package_weight_lbs NUMERIC,
  package_weight_oz NUMERIC,
  package_height_cm NUMERIC,
  package_height_in NUMERIC,
  package_length_cm NUMERIC,
  package_length_in NUMERIC,
  package_width_cm NUMERIC,
  package_width_in NUMERIC,
  
  -- Item Dimensions
  item_weight_grams NUMERIC,
  item_height_mm NUMERIC,
  item_length_mm NUMERIC,
  item_width_mm NUMERIC,
  item_weight_kg NUMERIC,
  item_weight_lbs NUMERIC,
  item_weight_oz NUMERIC,
  item_height_cm NUMERIC,
  item_height_in NUMERIC,
  item_length_cm NUMERIC,
  item_length_in NUMERIC,
  item_width_cm NUMERIC,
  item_width_in NUMERIC,
  dim_weight_oz NUMERIC,
  dim_weight_lbs NUMERIC,
  number_of_items INTEGER,
  package_quantity INTEGER,
  
  -- FBA Info
  fba_fees JSONB,
  referral_fee_percentage NUMERIC,
  variable_closing_fee NUMERIC,
  size_tier TEXT,
  size_tier_limits JSONB,
  remaining_weight_oz NUMERIC,
  remaining_weight_g NUMERIC,
  
  -- Timestamps
  listed_since TIMESTAMPTZ,
  tracking_since TIMESTAMPTZ,
  last_update TIMESTAMPTZ,
  last_price_change TIMESTAMPTZ,
  last_rating_update TIMESTAMPTZ,
  
  -- Flags
  availability_amazon TEXT,
  is_available BOOLEAN,
  fulfillment_type TEXT,
  is_adult_product BOOLEAN,
  is_eligible_for_trade_in BOOLEAN,
  is_eligible_for_super_saver BOOLEAN,
  is_sns BOOLEAN,
  is_redirect_asin BOOLEAN,
  is_prime_exclusive BOOLEAN,
  launchpad BOOLEAN,
  hazardous_materials JSONB,
  
  -- Content Features
  has_aplus BOOLEAN,
  aplus_modules JSONB,
  has_videos BOOLEAN,
  videos JSONB,
  video_count INTEGER,
  frequently_bought_together JSONB,
  
  -- Buy Box
  buy_box_seller_id TEXT,
  buy_box_is_fba BOOLEAN,
  buy_box_is_amazon BOOLEAN,
  buy_box_price_90d_avg NUMERIC,
  offers JSONB,
  offer_count INTEGER,
  
  -- Product-specific (Consumables)
  ingredients TEXT,
  active_ingredients JSONB,
  special_ingredients JSONB,
  nutrition_facts JSONB,
  warnings TEXT,
  directions TEXT,
  
  -- Stats
  stats JSONB,
  days_listed INTEGER,
  review_velocity NUMERIC,
  revenue_per_review NUMERIC,
  
  -- AI Analysis
  market_analysis JSONB,
  review_analysis JSONB,
  ai_opportunity_score NUMERIC,
  ai_risk_profile TEXT,
  ai_recession_proof_score NUMERIC,
  ai_competitive_intensity TEXT,
  ai_pricing_assessment TEXT,
  ai_entry_recommendation TEXT,
  ai_is_consumable BOOLEAN,
  ai_sentiment TEXT,
  ai_sentiment_score NUMERIC,

  -- SERP Analysis (Page 1 Rankings)
  serp_analysis JSONB,
  serp_position INTEGER,
  serp_on_page_one BOOLEAN,
  serp_p1_competitors INTEGER,
  serp_p1_avg_rating NUMERIC,
  serp_p1_avg_reviews INTEGER,
  serp_p1_avg_price NUMERIC,
  serp_sponsored_count INTEGER,
  serp_top_competitors JSONB,

  -- Variation Analysis (Aggregated Child ASIN Metrics)
  variation_analysis JSONB,
  var_total_analyzed INTEGER,
  var_sum_sales INTEGER,
  var_max_sales INTEGER,
  var_median_sales INTEGER,
  var_sum_revenue NUMERIC,
  var_max_revenue NUMERIC,
  var_median_revenue NUMERIC,
  var_min_price NUMERIC,
  var_max_price NUMERIC,
  var_median_price NUMERIC,
  var_price_range NUMERIC,
  var_avg_rating NUMERIC,
  var_median_rating NUMERIC,
  var_sum_reviews INTEGER,
  var_median_reviews INTEGER,
  var_avg_listing_age_days INTEGER,
  var_median_listing_age_days INTEGER,
  var_best_variation JSONB
);

-- Amazon Keywords Table (DataForSEO keyword data)
CREATE TABLE IF NOT EXISTS amazon_keywords (
  id BIGSERIAL PRIMARY KEY,
  research_id TEXT,
  asin TEXT,
  keyword TEXT,
  search_volume INTEGER,
  competition NUMERIC,
  cpc NUMERIC,
  rank INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Amazon Reviews Table (Individual reviews)
CREATE TABLE IF NOT EXISTS amazon_reviews (
  id BIGSERIAL PRIMARY KEY,
  research_id TEXT,
  asin TEXT,
  review_id TEXT,
  rating INTEGER,
  title TEXT,
  body TEXT,
  helpful_votes INTEGER,
  has_images BOOLEAN,
  has_videos BOOLEAN,
  verified_purchase BOOLEAN,
  review_date TEXT,
  page_number INTEGER,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Amazon Review Summaries Table (AI-analyzed review summaries)
CREATE TABLE IF NOT EXISTS amazon_review_summaries (
  id BIGSERIAL PRIMARY KEY,
  research_id TEXT UNIQUE,
  asin TEXT,
  total_reviews INTEGER,
  pages_scraped INTEGER,
  pages_blocked INTEGER,
  avg_rating NUMERIC,
  rating_5 INTEGER,
  rating_4 INTEGER,
  rating_3 INTEGER,
  rating_2 INTEGER,
  rating_1 INTEGER,
  ai_sentiment TEXT,
  ai_pain_points JSONB,
  ai_praised_features JSONB,
  ai_key_insight TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ============================================
-- INDEXES
-- ============================================
CREATE INDEX IF NOT EXISTS idx_amazon_products_asin ON amazon_products(asin);
CREATE INDEX IF NOT EXISTS idx_amazon_products_brand ON amazon_products(brand);
CREATE INDEX IF NOT EXISTS idx_amazon_products_research ON amazon_products(research_id);
CREATE INDEX IF NOT EXISTS idx_amazon_keywords_asin ON amazon_keywords(asin);
CREATE INDEX IF NOT EXISTS idx_amazon_keywords_research ON amazon_keywords(research_id);
CREATE INDEX IF NOT EXISTS idx_amazon_reviews_asin ON amazon_reviews(asin);
CREATE INDEX IF NOT EXISTS idx_amazon_reviews_research ON amazon_reviews(research_id);
CREATE INDEX IF NOT EXISTS idx_amazon_review_summaries_asin ON amazon_review_summaries(asin);

-- ============================================
-- ROW LEVEL SECURITY (Optional)
-- ============================================
-- ALTER TABLE amazon_products ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE amazon_keywords ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE amazon_reviews ENABLE ROW LEVEL SECURITY;
-- ALTER TABLE amazon_review_summaries ENABLE ROW LEVEL SECURITY;
