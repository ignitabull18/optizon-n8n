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

## API Integrations

- **Keepa** - Amazon product data, pricing history, BSR tracking
- **DataForSEO** - Amazon keyword search volume and competition
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
    "reviewService": "apify",
    "keepaKey": "...",
    "apifyToken": "...",
    "openaiKey": "...",
    "sbUrl": "...",
    "sbKey": "..."
  }'
```

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

| Service | Cost per Research |
|---------|-------------------|
| Keepa | ~$0.10 (5 tokens) |
| Apify | ~$0.02 (10 reviews) |
| OpenAI | ~$0.02 (GPT-5.2) |
| Supabase | Free tier |
| **Total** | **~$0.14** |

## Database Schema

See `/schemas/supabase-schema.sql` for the full PostgreSQL schema including:

- `amazon_products` - 100+ fields for comprehensive product data
- `amazon_keywords` - Keyword search volume and competition
- `amazon_reviews` - Individual review data
- `amazon_review_summaries` - AI-analyzed review insights

## License

MIT
