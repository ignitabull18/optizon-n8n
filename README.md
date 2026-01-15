# Optizon n8n Workflows

Amazon product research automation workflows for n8n.

## Workflows

| Workflow | Description | Webhook Path |
|----------|-------------|--------------|
| **Amazon Research - Complete + Supabase** | Full research pipeline with AI analysis and Supabase storage | `/research-supabase` |
| **Amazon Research - FBA Calculator** | Calculate FBA fees and margins | `/fba-calculator` |
| **Amazon Review Scraper - Proxy** | Review scraping with proxy rotation | `/proxy-review-scrape` |
| **Amazon Review Scraper - Parallel** | Parallel batch review scraping | `/review-scraper` |
| **Amazon Research - Pipeline** | Keepa + DataForSEO + Reviews | `/complete-research` |

## Features

### FBA Calculator
- Dimensional weight calculation
- Size tier determination (Small Standard, Large Standard, etc.)
- 2024 FBA fee structures with peak season surcharges
- Margin analysis and capacity utilization

### Variation Analysis
- Batch fetch all child ASINs in single Keepa request
- Aggregate metrics: SUM, MEDIAN, MAX for sales/revenue/reviews
- Best variation identification
- Price range and listing age analysis

### SERP Rankings (Optional)
- DataForSEO Amazon SERP API integration
- Page 1 competitor analysis
- Sponsored listing count
- Average ratings and reviews of top competitors

## API Integrations

- **Keepa** - Amazon product data, pricing history, BSR tracking, variation data
- **DataForSEO** - Amazon keyword search volume, competition, and SERP rankings
- **Apify** - Amazon review scraping (alternative)
- **Bright Data** - Proxy and scraping services
- **OpenAI** - AI market analysis and review sentiment
- **Supabase** - PostgreSQL database storage

## Setup

### 1. Import Workflows

Import the JSON files from `/workflows` into your n8n instance.

### 2. Create Database

Run the SQL schema from `/schemas/supabase-schema.sql` in your Supabase project.

### 3. Configure API Keys

Set these in your workflow request body or n8n environment variables:

```json
{
  "keepaKey": "your-keepa-api-key",
  "apifyToken": "your-apify-token",
  "openaiKey": "your-openai-key",
  "sbUrl": "https://your-project.supabase.co",
  "sbKey": "your-supabase-service-role-key"
}
```

## Usage

### Research a Product (with Supabase)

```bash
curl -X POST https://your-n8n.com/webhook/research-supabase \
  -H "Content-Type: application/json" \
  -d '{
    "asin": "B09V3KXJPB",
    "saveToSupabase": true,
    "runAiAnalysis": true,
    "scrapeReviews": true,
    "analyzeVariations": true,
    "runSerpAnalysis": false,
    "reviewService": "apify",
    "keepaKey": "...",
    "apifyToken": "...",
    "openaiKey": "...",
    "sbUrl": "...",
    "sbKey": "...",
    "dataforseoAuth": "..."
  }'
```

### Request Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `asin` | string | required | Amazon ASIN to research |
| `saveToSupabase` | boolean | false | Save results to Supabase |
| `runAiAnalysis` | boolean | false | Run AI market/review analysis |
| `scrapeReviews` | boolean | false | Scrape product reviews |
| `analyzeVariations` | boolean | false | Fetch and aggregate variation data |
| `runSerpAnalysis` | boolean | false | Run SERP rankings analysis |
| `reviewService` | string | "apify" | Review service: "apify" or "brightdata" |

### Calculate FBA Fees

```bash
curl -X POST https://your-n8n.com/webhook/fba-calculator \
  -H "Content-Type: application/json" \
  -d '{
    "asin": "B09V3KXJPB",
    "keepaKey": "..."
  }'
```

## Cost Estimates

| Service | Cost per Research | Notes |
|---------|-------------------|-------|
| Keepa (Product) | ~$0.10 | 5 tokens |
| Keepa (Variations) | ~$0.20-0.40 | 10-20 tokens for batch |
| DataForSEO (SERP) | ~$0.01 | Per ASIN |
| Apify (Reviews) | ~$0.02 | 10 reviews |
| OpenAI | ~$0.02 | GPT-4o |
| Supabase | Free | Free tier |
| **Total (Basic)** | **~$0.14** | Without variations |
| **Total (Full)** | **~$0.35** | With variations + SERP |

## Database Schema

See `/schemas/supabase-schema.sql` for the full PostgreSQL schema including:

- `amazon_products` - 100+ fields for comprehensive product data
- `amazon_keywords` - Keyword search volume and competition
- `amazon_reviews` - Individual review data
- `amazon_review_summaries` - AI-analyzed review insights

## License

MIT
