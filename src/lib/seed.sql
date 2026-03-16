-- ============================================================
-- Krestlogic Systems Seed Data — Computers, Software, Accessories & Hardware
-- Run via: GET /api/db/seed?secret=seed-db-2024
-- ============================================================

-- ── Categories ───────────────────────────────────────────────

-- Parent categories
INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count) VALUES
  ('Computers',    'computers',    'Laptops, desktops, workstations and all-in-one PCs',                    NULL, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400', 0),
  ('Software',     'software',     'Operating systems, productivity suites, security and developer tools',  NULL, 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400', 0),
  ('Accessories',  'accessories',  'Keyboards, mice, monitors, headsets and peripheral equipment',          NULL, 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400', 0),
  ('Hardware',     'hardware',     'Internal components, storage, memory, graphics cards and networking',   NULL, 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400', 0)
ON CONFLICT (slug) DO NOTHING;

-- Sub-categories: Computers
INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Laptops', 'laptops', 'Ultrabooks, gaming laptops and professional notebooks', id,
  'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400', 0
FROM krestlogic_categories WHERE slug = 'computers' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Desktops & Workstations', 'desktops-workstations', 'Tower PCs, mini PCs and professional workstations', id,
  'https://images.unsplash.com/photo-1593640495253-23196b27a87f?w=400', 0
FROM krestlogic_categories WHERE slug = 'computers' ON CONFLICT (slug) DO NOTHING;

-- Sub-categories: Software
INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Operating Systems', 'operating-systems', 'Windows, macOS and Linux distribution licenses', id,
  'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=400', 0
FROM krestlogic_categories WHERE slug = 'software' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Productivity Software', 'productivity-software', 'Office suites, note-taking and collaboration tools', id,
  'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=400', 0
FROM krestlogic_categories WHERE slug = 'software' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Security & Antivirus', 'security-antivirus', 'Antivirus, VPN services and cybersecurity software', id,
  'https://images.unsplash.com/photo-1614064641938-3bbee52942c7?w=400', 0
FROM krestlogic_categories WHERE slug = 'software' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Developer Tools', 'developer-tools', 'IDEs, version control, AI coding assistants and dev utilities', id,
  'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=400', 0
FROM krestlogic_categories WHERE slug = 'software' ON CONFLICT (slug) DO NOTHING;

-- Sub-categories: Accessories
INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Keyboards & Mice', 'keyboards-mice', 'Mechanical keyboards, ergonomic mice and wireless combos', id,
  'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=400', 0
FROM krestlogic_categories WHERE slug = 'accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Monitors & Displays', 'monitors-displays', '4K, QHD and curved monitors for work and gaming', id,
  'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=400', 0
FROM krestlogic_categories WHERE slug = 'accessories' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Audio & Headsets', 'audio-headsets', 'Noise-cancelling headphones, headsets and desktop speakers', id,
  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400', 0
FROM krestlogic_categories WHERE slug = 'accessories' ON CONFLICT (slug) DO NOTHING;

-- Sub-categories: Hardware
INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Storage', 'storage', 'Internal NVMe SSDs, external drives and USB flash drives', id,
  'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=400', 0
FROM krestlogic_categories WHERE slug = 'hardware' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Memory & RAM', 'memory-ram', 'DDR4 and DDR5 desktop and laptop memory modules', id,
  'https://images.unsplash.com/photo-1562976540-1502c2145851?w=400', 0
FROM krestlogic_categories WHERE slug = 'hardware' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Graphics Cards', 'graphics-cards', 'NVIDIA and AMD discrete GPUs for gaming and professional workloads', id,
  'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=400', 0
FROM krestlogic_categories WHERE slug = 'hardware' ON CONFLICT (slug) DO NOTHING;

INSERT INTO krestlogic_categories (name, slug, description, parent_id, image_url, count)
SELECT 'Networking', 'networking', 'WiFi 6 routers, mesh systems, switches and network adapters', id,
  'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=400', 0
FROM krestlogic_categories WHERE slug = 'hardware' ON CONFLICT (slug) DO NOTHING;

-- ── Products ─────────────────────────────────────────────────

-- ── COMPUTERS ────────────────────────────────────────────────

-- 1. Dell XPS 15 Laptop
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Dell XPS 15 (Core i7-13700H, 16GB RAM, 512GB SSD)',
  'dell-xps-15-i7-16gb-512gb',
  'DEL-XPS15-I7-16-512',
  'The Dell XPS 15 combines premium build quality with powerhouse performance. Intel Core i7-13700H (14 cores), 16GB LPDDR5 RAM, 512GB PCIe NVMe SSD, and a stunning 15.6" OLED 3.5K touch display at 60Hz. NVIDIA GeForce RTX 4060 (6GB GDDR6) handles demanding creative workloads. Thunderbolt 4, USB-C, SD card reader. Backlit keyboard, Windows 11 Home pre-installed.',
  'Intel Core i7-13700H, 15.6" OLED 3.5K, RTX 4060 — premium Windows ultrabook',
  895000, 980000, 895000, 'instock', 12, 47, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 2. Apple MacBook Pro 14" M3
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple MacBook Pro 14" M3 (8GB Unified Memory, 512GB SSD)',
  'apple-macbook-pro-14-m3-8gb-512gb',
  'APL-MBP14-M3-8-512',
  'The MacBook Pro 14" with M3 chip delivers exceptional performance for professionals. 8-core CPU and 10-core GPU, 8GB unified memory, 512GB SSD, and a breathtaking 14.2" Liquid Retina XDR ProMotion display (up to 120Hz). Up to 22 hours battery life. Three Thunderbolt 4 ports, HDMI 2.1, SD card slot, MagSafe 3. macOS Sonoma pre-installed.',
  'Apple M3 chip, 14" Liquid Retina XDR, up to 22-hr battery — macOS powerhouse',
  1150000, 1250000, 1150000, 'instock', 8, 63, 4.90, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 3. HP Victus 15 Gaming Laptop
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'HP Victus 15 Gaming Laptop (Ryzen 5 7535HS, RTX 3050, 8GB, 512GB)',
  'hp-victus-15-r5-rtx3050-8gb',
  'HP-VIC15-R5-3050-512',
  'The HP Victus 15 is an accessible gaming and content creation laptop. AMD Ryzen 5 7535HS (6 cores), NVIDIA GeForce RTX 3050 (4GB), 8GB DDR5 RAM, 512GB PCIe SSD. 15.6" FHD IPS display at 144Hz for smooth gameplay. Dual-fan thermal design keeps performance sustained. USB-A, USB-C, HDMI 2.1 and a full-size WASD-highlighted keyboard with backlight. Windows 11 Home.',
  'Ryzen 5 + RTX 3050, 15.6" 144Hz — capable gaming and creation on a budget',
  498000, 560000, 498000, 'instock', 20, 38, 4.55, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 4. Apple Mac Mini M2
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Apple Mac Mini M2 (8GB Unified Memory, 256GB SSD)',
  'apple-mac-mini-m2-8gb-256gb',
  'APL-MMINI-M2-8-256',
  'The Apple Mac Mini M2 packs desktop performance into an incredibly compact 197mm square footprint. 8-core CPU, 10-core GPU, 8GB unified memory and 256GB SSD. Supports up to two displays simultaneously — HDMI 2.0 for 4K@60Hz and one Thunderbolt 4 port for up to 6K. Two more Thunderbolt 4, two USB-A, HDMI and Gigabit Ethernet round out the ports. macOS Ventura.',
  'Compact desktop powerhouse — Apple M2, dual display support, silent fanless chassis',
  490000, 545000, 490000, 'instock', 15, 54, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 5. Lenovo ThinkPad X1 Carbon Gen 11
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Lenovo ThinkPad X1 Carbon Gen 11 (Core i7-1365U, 16GB, 512GB)',
  'lenovo-thinkpad-x1-carbon-gen11',
  'LNV-X1CG11-I7-16-512',
  'The ThinkPad X1 Carbon Gen 11 is the ultimate business ultrabook at just 1.12kg. Intel Core i7-1365U vPro, 16GB LPDDR5 RAM, 512GB PCIe Gen 4 SSD. 14" IPS anti-glare display at 1920×1200 (16:10). MIL-SPEC 810H tested for durability. Backlit keyboard with TrackPoint, IR camera, Thunderbolt 4 (×2), USB-A, HDMI 2.0. 15-hour battery. Windows 11 Pro.',
  'Business-class ultrabook — MIL-SPEC rugged, 1.12kg, i7 vPro and 15-hr battery',
  780000, 860000, 780000, 'instock', 10, 29, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- ── SOFTWARE ──────────────────────────────────────────────────

-- 6. Microsoft 365 Personal (1-Year)
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Microsoft 365 Personal (1-Year Subscription)',
  'microsoft-365-personal-1yr',
  'MSF-365-PER-1YR',
  'Microsoft 365 Personal gives you the full Office suite — Word, Excel, PowerPoint, Outlook, OneNote and more — on up to 5 devices. Includes 1TB OneDrive cloud storage, advanced AI-powered features (Copilot in Word and Excel), real-time collaboration and automatic updates. Digital delivery via email within minutes of purchase.',
  'Full Office suite with 1TB OneDrive — Word, Excel, PowerPoint and more for 5 devices',
  45000, 52000, 45000, 'instock', 999, 64, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 7. Windows 11 Pro OEM License Key
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Windows 11 Pro OEM License Key',
  'windows-11-pro-oem-key',
  'MSF-WIN11P-OEM',
  'Genuine Windows 11 Pro OEM product key for one PC. Activate via Microsoft''s official servers — no subscription required. Includes BitLocker encryption, Hyper-V virtualisation, Remote Desktop, Windows Sandbox and all enterprise-grade security features. 64-bit, compatible with TPM 2.0 systems. Digital delivery.',
  'Genuine Windows 11 Pro lifetime license — activate online in minutes',
  38000, 45000, 38000, 'instock', 500, 82, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 8. Norton 360 Deluxe (5 Devices, 1 Year)
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Norton 360 Deluxe — 5 Devices, 1 Year',
  'norton-360-deluxe-5dev-1yr',
  'NRT-360D-5D1Y',
  'Norton 360 Deluxe protects up to 5 PCs, Macs, smartphones and tablets with real-time threat detection, Smart Firewall, Secure VPN (unlimited data), Password Manager, 50GB cloud backup and Dark Web Monitoring. Consistently rated #1 in independent antivirus tests. Instant digital activation — no physical CD required.',
  'Complete protection for 5 devices — antivirus, VPN, firewall and dark web monitoring',
  28000, 35000, 28000, 'instock', 999, 58, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 9. Bitdefender Total Security (5 Devices, 1 Year)
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Bitdefender Total Security — 5 Devices, 1 Year',
  'bitdefender-total-security-5dev-1yr',
  'BDF-TS-5D1Y',
  'Bitdefender Total Security delivers award-winning multi-layer malware protection for Windows, macOS, iOS and Android. Features include Advanced Threat Defense, Anti-Ransomware, Anti-Phishing, Webcam Protection, Microphone Monitor, Parental Controls, Safe Online Banking browser and battery/performance optimisation for laptops.',
  'Award-winning multi-layer security for 5 devices — Windows, Mac, iOS and Android',
  25000, 30000, 25000, 'instock', 999, 47, 4.70, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 10. JetBrains All Products Pack (1-Year)
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'JetBrains All Products Pack (1-Year)',
  'jetbrains-all-products-pack-1yr',
  'JTB-ALL-1YR',
  'JetBrains All Products Pack gives developers access to the full suite of JetBrains IDEs — IntelliJ IDEA Ultimate, PyCharm, WebStorm, GoLand, DataGrip, CLion, Rider, PhpStorm, RubyMine and more. Industry-leading code completion, refactoring tools, built-in debugger and deep framework integrations. Supports macOS, Windows and Linux.',
  'Every JetBrains IDE in one subscription — IntelliJ, PyCharm, WebStorm and more',
  95000, 110000, 95000, 'instock', 999, 29, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 11. GitHub Copilot Individual (1-Year)
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'GitHub Copilot Individual (1-Year)',
  'github-copilot-individual-1yr',
  'GHB-COP-IND-1YR',
  'GitHub Copilot is your AI pair programmer, suggesting code completions in real time inside VS Code, JetBrains, Neovim and more. Trained on billions of lines of public code, Copilot helps you write functions, tests and boilerplate faster. Includes Copilot Chat for natural language code Q&A. Annual subscription with immediate activation.',
  'AI code completions in VS Code and JetBrains — write code faster with AI',
  18000, 22000, 18000, 'instock', 999, 55, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- ── ACCESSORIES ───────────────────────────────────────────────

-- 12. Logitech MX Keys Advanced Wireless Keyboard
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech MX Keys Advanced Wireless Keyboard',
  'logitech-mx-keys-wireless-keyboard',
  'LOG-MXKEYS-BLK',
  'The Logitech MX Keys is designed for productivity across multiple devices. Backlit spherically dished keys perfectly match fingertips for precise, comfortable typing. Smart Illumination adjusts to ambient light. Easy-Switch button pairs up to 3 computers (Windows, macOS, Linux). Rechargeable — 10 days on a charge. USB-C charging.',
  'Premium backlit wireless keyboard — pair 3 devices, 10-day battery, USB-C charging',
  98000, 115000, 98000, 'instock', 35, 44, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 13. Razer BlackWidow V3 TKL Mechanical Keyboard
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Razer BlackWidow V3 TKL Mechanical Keyboard',
  'razer-blackwidow-v3-tkl',
  'RZR-BW3TKL-BLK',
  'The Razer BlackWidow V3 TKL features Razer Green mechanical switches with tactile, clicky feedback rated for 80 million keystrokes. Compact tenkeyless layout saves desk space. Per-key RGB backlighting with Chroma RGB sync, N-Key rollover for 100% anti-ghosting, and a double-shot ABS keycap set. USB-C detachable cable.',
  'Compact TKL mechanical keyboard with Razer Green switches and per-key RGB',
  75000, 88000, 75000, 'instock', 28, 36, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 14. Logitech MX Master 3S Wireless Mouse
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Logitech MX Master 3S Wireless Mouse',
  'logitech-mx-master-3s-mouse',
  'LOG-MXM3S-GRY',
  'The Logitech MX Master 3S is the flagship productivity mouse with an 8000 DPI sensor that tracks on any surface including glass. MagSpeed electromagnetic scrolling wheel travels through 1,000 lines per second. Customisable thumb wheel and side buttons. Pairs to up to 3 devices via Logi Bolt receiver or Bluetooth. Rechargeable via USB-C — 70 days per charge.',
  'Flagship wireless productivity mouse — MagSpeed scroll, 8000 DPI, 70-day battery',
  85000, 98000, 85000, 'instock', 40, 61, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 15. LG 27" UltraGear QHD 165Hz Monitor
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'LG 27" UltraGear QHD 165Hz Gaming Monitor',
  'lg-27-ultragear-qhd-165hz',
  'LG-27GP850-B',
  'The LG 27GP850-B UltraGear delivers a 2560×1440 QHD Nano IPS panel with a blazing 165Hz refresh rate and 1ms GtG response time. Covers 98% of DCI-P3 for vivid, accurate colours. NVIDIA G-Sync Compatible and AMD FreeSync Premium Pro eliminate screen tearing. Two HDMI 2.0 ports + one DisplayPort 1.4. Height, tilt and pivot adjustable stand.',
  '27" QHD Nano IPS, 165Hz, 1ms — G-Sync Compatible and FreeSync Premium Pro',
  285000, 320000, 285000, 'instock', 14, 31, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 16. Dell UltraSharp 27" 4K USB-C Monitor
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Dell UltraSharp 27" 4K USB-C Monitor (U2723D)',
  'dell-ultrasharp-27-4k-usb-c',
  'DEL-U2723D-BLK',
  'The Dell UltraSharp U2723D features a 27" 4K IPS Black panel with 2000:1 contrast. Covers 100% sRGB and 98% DCI-P3. One USB-C port delivers 90W power delivery, two Thunderbolt 4 ports with 40Gbps data, a 4-port USB hub and RJ45 Ethernet. VESA-certified DisplayHDR 400. ComfortView Plus certified for reduced blue light.',
  '27" 4K IPS Black, 90W USB-C, Thunderbolt 4 — the ideal professional display',
  385000, 430000, 385000, 'instock', 10, 26, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 17. Sony WH-1000XM5 Wireless Headphones
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Sony WH-1000XM5 Wireless Noise-Cancelling Headphones',
  'sony-wh-1000xm5-headphones',
  'SNY-WH1000XM5-BLK',
  'The Sony WH-1000XM5 sets the benchmark for wireless noise-cancelling headphones. Eight microphones with two processors deliver industry-leading ANC. 30-hour battery life (3-hour quick charge adds 3 hours in 3 minutes). Multipoint Bluetooth connects to two devices simultaneously. Hi-Res Audio certified, LDAC codec. Speak-to-Chat and Adaptive Sound Control via Sony Headphones Connect app.',
  'Industry-leading noise cancellation, 30-hr battery, Multipoint Bluetooth — flagship ANC',
  195000, 225000, 195000, 'instock', 22, 73, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- ── HARDWARE ─────────────────────────────────────────────────

-- 18. Samsung 990 Pro 1TB NVMe SSD
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung 990 Pro 1TB PCIe 4.0 NVMe SSD (M.2)',
  'samsung-990-pro-1tb-nvme',
  'SAM-990PRO-1TB-M2',
  'The Samsung 990 Pro delivers sequential read speeds up to 7,450 MB/s and write speeds up to 6,900 MB/s over PCIe 4.0 ×4. Intelligent Thermal Control and nickel-coated controller keep temperatures in check under sustained workloads. 5-year limited warranty with 600 TBW endurance rating. M.2 2280 form factor — compatible with desktops, laptops and PS5.',
  '1TB NVMe PCIe 4.0 — 7450MB/s reads, 5-year warranty, PS5 compatible',
  95000, 112000, 95000, 'instock', 45, 58, 4.85, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 19. Samsung T7 Shield 2TB Portable SSD
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Samsung T7 Shield 2TB Portable SSD',
  'samsung-t7-shield-2tb-ssd',
  'SAM-T7SH-2TB-BLK',
  'The Samsung T7 Shield is a rugged portable SSD built for creators on the move. IP65-rated for dust and water resistance, 1500N crush resistance and drop-tested from 3 meters. Read speeds up to 1,050 MB/s and write speeds up to 1,000 MB/s via USB 3.2 Gen 2. Includes USB-C to C and USB-C to A cables. Compatible with PC, Mac, Android and gaming consoles.',
  'Rugged 2TB portable SSD — IP65, 1050MB/s reads, drop-tested from 3m',
  95000, 110000, 95000, 'instock', 22, 38, 4.80, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 20. Corsair Vengeance 32GB DDR5-5600 RAM Kit
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'Corsair Vengeance 32GB DDR5-5600 RAM Kit (2×16GB)',
  'corsair-vengeance-32gb-ddr5-5600',
  'COR-VNG-32G-DDR5-5600',
  'Corsair Vengeance DDR5 delivers high-performance memory for Intel 12th/13th/14th Gen and AMD Ryzen 7000 platforms. 32GB (2×16GB) kit running at 5600MHz CL36. On-Die ECC (OECC) ensures data integrity at higher frequencies. Custom Intel XMP 3.0 and AMD EXPO profiles for one-click overclocking. Compact low-profile aluminum heat spreader. Lifetime warranty.',
  '32GB DDR5-5600 kit — Intel XMP 3.0 & AMD EXPO, on-die ECC, lifetime warranty',
  85000, 98000, 85000, 'instock', 30, 42, 4.75, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 21. ASUS Dual RTX 4060 OC 8GB Graphics Card
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'ASUS Dual GeForce RTX 4060 OC Edition 8GB GDDR6',
  'asus-dual-rtx-4060-oc-8gb',
  'ASU-DRTX4060-OC-8G',
  'The ASUS Dual RTX 4060 OC features NVIDIA''s Ada Lovelace architecture with 8GB GDDR6 memory and a 128-bit memory bus. DLSS 3 Frame Generation and Ray Tracing support deliver exceptional gaming performance at 1080p and 1440p. Dual Axial-tech fans with Auto-Extreme manufacturing. Boosted clock at 2505MHz. PCIe 4.0 ×8, one HDMI 2.1 and three DisplayPort 1.4a outputs.',
  'RTX 4060 8GB, DLSS 3, 2505MHz boost — capable 1080p/1440p gaming GPU',
  295000, 340000, 295000, 'instock', 18, 35, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- 22. TP-Link Archer AX73 WiFi 6 Router
INSERT INTO krestlogic_products (name, slug, sku, description, short_description, price, regular_price, sale_price, stock_status, stock_quantity, rating_count, average_rating, status)
VALUES (
  'TP-Link Archer AX73 AX5400 WiFi 6 Router',
  'tp-link-archer-ax73-wifi6',
  'TPL-AX73-BLK',
  'The TP-Link Archer AX73 is a next-generation WiFi 6 router delivering combined speeds up to 5400 Mbps. The 6-antenna design with beamforming covers large homes. OFDMA and MU-MIMO handle 128+ simultaneous devices without congestion. One 2.5G WAN port, four Gigabit LAN ports, USB 3.0 port for network storage sharing. HomeShield security built in.',
  'WiFi 6 router with 5400Mbps, 2.5G WAN port and support for 128+ devices',
  65000, 78000, 65000, 'instock', 20, 33, 4.65, 'publish'
) ON CONFLICT (slug) DO NOTHING;

-- ── Product Images ────────────────────────────────────────────

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=600', 'Dell XPS 15', 'Dell XPS 15 Laptop', 0
FROM krestlogic_products p WHERE p.slug = 'dell-xps-15-i7-16gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600', 'Apple MacBook Pro 14"', 'Apple MacBook Pro 14 M3', 0
FROM krestlogic_products p WHERE p.slug = 'apple-macbook-pro-14-m3-8gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600', 'HP Victus 15', 'HP Victus 15 Gaming Laptop', 0
FROM krestlogic_products p WHERE p.slug = 'hp-victus-15-r5-rtx3050-8gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593640495253-23196b27a87f?w=600', 'Apple Mac Mini M2', 'Apple Mac Mini M2 Desktop', 0
FROM krestlogic_products p WHERE p.slug = 'apple-mac-mini-m2-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=600', 'Lenovo ThinkPad X1 Carbon', 'Lenovo ThinkPad X1 Carbon Gen 11', 0
FROM krestlogic_products p WHERE p.slug = 'lenovo-thinkpad-x1-carbon-gen11' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b?w=600', 'Microsoft 365 Personal', 'Microsoft 365 Personal', 0
FROM krestlogic_products p WHERE p.slug = 'microsoft-365-personal-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=600', 'Windows 11 Pro', 'Windows 11 Pro OEM License Key', 0
FROM krestlogic_products p WHERE p.slug = 'windows-11-pro-oem-key' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1614064641938-3bbee52942c7?w=600', 'Norton 360 Deluxe', 'Norton 360 Deluxe 5 Devices', 0
FROM krestlogic_products p WHERE p.slug = 'norton-360-deluxe-5dev-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1614064641938-3bbee52942c7?w=600', 'Bitdefender Total Security', 'Bitdefender Total Security', 0
FROM krestlogic_products p WHERE p.slug = 'bitdefender-total-security-5dev-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=600', 'JetBrains All Products Pack', 'JetBrains All Products Pack', 0
FROM krestlogic_products p WHERE p.slug = 'jetbrains-all-products-pack-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=600', 'GitHub Copilot Individual', 'GitHub Copilot Individual', 0
FROM krestlogic_products p WHERE p.slug = 'github-copilot-individual-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1587829741301-dc798b83add3?w=600', 'Logitech MX Keys', 'Logitech MX Keys Advanced Keyboard', 0
FROM krestlogic_products p WHERE p.slug = 'logitech-mx-keys-wireless-keyboard' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=600', 'Razer BlackWidow V3 TKL', 'Razer BlackWidow V3 TKL Keyboard', 0
FROM krestlogic_products p WHERE p.slug = 'razer-blackwidow-v3-tkl' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=600', 'Logitech MX Master 3S', 'Logitech MX Master 3S Wireless Mouse', 0
FROM krestlogic_products p WHERE p.slug = 'logitech-mx-master-3s-mouse' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'LG UltraGear 27" QHD', 'LG 27 UltraGear QHD 165Hz Monitor', 0
FROM krestlogic_products p WHERE p.slug = 'lg-27-ultragear-qhd-165hz' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1527443224154-c4a3942d3acf?w=600', 'Dell UltraSharp 27" 4K', 'Dell UltraSharp 27 4K USB-C Monitor', 0
FROM krestlogic_products p WHERE p.slug = 'dell-ultrasharp-27-4k-usb-c' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600', 'Sony WH-1000XM5', 'Sony WH-1000XM5 Wireless Headphones', 0
FROM krestlogic_products p WHERE p.slug = 'sony-wh-1000xm5-headphones' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Samsung 990 Pro NVMe SSD', 'Samsung 990 Pro 1TB NVMe SSD', 0
FROM krestlogic_products p WHERE p.slug = 'samsung-990-pro-1tb-nvme' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1597872200969-2b65d56bd16b?w=600', 'Samsung T7 Shield 2TB', 'Samsung T7 Shield 2TB Portable SSD', 0
FROM krestlogic_products p WHERE p.slug = 'samsung-t7-shield-2tb-ssd' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1562976540-1502c2145851?w=600', 'Corsair Vengeance DDR5', 'Corsair Vengeance 32GB DDR5-5600 RAM', 0
FROM krestlogic_products p WHERE p.slug = 'corsair-vengeance-32gb-ddr5-5600' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1591488320449-011701bb6704?w=600', 'ASUS Dual RTX 4060', 'ASUS Dual GeForce RTX 4060 OC 8GB', 0
FROM krestlogic_products p WHERE p.slug = 'asus-dual-rtx-4060-oc-8gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_images (product_id, src, name, alt, position)
SELECT p.id, 'https://images.unsplash.com/photo-1606904825846-647eb07f5be2?w=600', 'TP-Link Archer AX73', 'TP-Link Archer AX73 WiFi 6 Router', 0
FROM krestlogic_products p WHERE p.slug = 'tp-link-archer-ax73-wifi6' ON CONFLICT DO NOTHING;

-- ── Product ↔ Category Links ──────────────────────────────────

-- Dell XPS 15 → computers, laptops
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'dell-xps-15-i7-16gb-512gb' AND c.slug IN ('computers','laptops')
ON CONFLICT DO NOTHING;

-- MacBook Pro → computers, laptops
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'apple-macbook-pro-14-m3-8gb-512gb' AND c.slug IN ('computers','laptops')
ON CONFLICT DO NOTHING;

-- HP Victus 15 → computers, laptops
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'hp-victus-15-r5-rtx3050-8gb' AND c.slug IN ('computers','laptops')
ON CONFLICT DO NOTHING;

-- Mac Mini → computers, desktops-workstations
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'apple-mac-mini-m2-8gb-256gb' AND c.slug IN ('computers','desktops-workstations')
ON CONFLICT DO NOTHING;

-- ThinkPad X1 Carbon → computers, laptops
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'lenovo-thinkpad-x1-carbon-gen11' AND c.slug IN ('computers','laptops')
ON CONFLICT DO NOTHING;

-- Microsoft 365 → software, productivity-software
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'microsoft-365-personal-1yr' AND c.slug IN ('software','productivity-software')
ON CONFLICT DO NOTHING;

-- Windows 11 Pro → software, operating-systems
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'windows-11-pro-oem-key' AND c.slug IN ('software','operating-systems')
ON CONFLICT DO NOTHING;

-- Norton 360 → software, security-antivirus
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'norton-360-deluxe-5dev-1yr' AND c.slug IN ('software','security-antivirus')
ON CONFLICT DO NOTHING;

-- Bitdefender → software, security-antivirus
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'bitdefender-total-security-5dev-1yr' AND c.slug IN ('software','security-antivirus')
ON CONFLICT DO NOTHING;

-- JetBrains → software, developer-tools
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'jetbrains-all-products-pack-1yr' AND c.slug IN ('software','developer-tools')
ON CONFLICT DO NOTHING;

-- GitHub Copilot → software, developer-tools
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'github-copilot-individual-1yr' AND c.slug IN ('software','developer-tools')
ON CONFLICT DO NOTHING;

-- Logitech MX Keys → accessories, keyboards-mice
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'logitech-mx-keys-wireless-keyboard' AND c.slug IN ('accessories','keyboards-mice')
ON CONFLICT DO NOTHING;

-- Razer BlackWidow → accessories, keyboards-mice
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'razer-blackwidow-v3-tkl' AND c.slug IN ('accessories','keyboards-mice')
ON CONFLICT DO NOTHING;

-- Logitech MX Master 3S → accessories, keyboards-mice
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'logitech-mx-master-3s-mouse' AND c.slug IN ('accessories','keyboards-mice')
ON CONFLICT DO NOTHING;

-- LG UltraGear Monitor → accessories, monitors-displays
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'lg-27-ultragear-qhd-165hz' AND c.slug IN ('accessories','monitors-displays')
ON CONFLICT DO NOTHING;

-- Dell UltraSharp Monitor → accessories, monitors-displays
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'dell-ultrasharp-27-4k-usb-c' AND c.slug IN ('accessories','monitors-displays')
ON CONFLICT DO NOTHING;

-- Sony WH-1000XM5 → accessories, audio-headsets
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'sony-wh-1000xm5-headphones' AND c.slug IN ('accessories','audio-headsets')
ON CONFLICT DO NOTHING;

-- Samsung 990 Pro → hardware, storage
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'samsung-990-pro-1tb-nvme' AND c.slug IN ('hardware','storage')
ON CONFLICT DO NOTHING;

-- Samsung T7 Shield → hardware, storage
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'samsung-t7-shield-2tb-ssd' AND c.slug IN ('hardware','storage')
ON CONFLICT DO NOTHING;

-- Corsair Vengeance DDR5 → hardware, memory-ram
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'corsair-vengeance-32gb-ddr5-5600' AND c.slug IN ('hardware','memory-ram')
ON CONFLICT DO NOTHING;

-- ASUS RTX 4060 → hardware, graphics-cards
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'asus-dual-rtx-4060-oc-8gb' AND c.slug IN ('hardware','graphics-cards')
ON CONFLICT DO NOTHING;

-- TP-Link AX73 → hardware, networking
INSERT INTO krestlogic_product_categories (product_id, category_id)
SELECT p.id, c.id FROM krestlogic_products p, krestlogic_categories c
WHERE p.slug = 'tp-link-archer-ax73-wifi6' AND c.slug IN ('hardware','networking')
ON CONFLICT DO NOTHING;

-- ── Product Attributes ────────────────────────────────────────

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Processor', ARRAY['Intel Core i7-13700H'], 0 FROM krestlogic_products WHERE slug = 'dell-xps-15-i7-16gb-512gb' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'RAM', ARRAY['16GB', '32GB'], 1 FROM krestlogic_products WHERE slug = 'dell-xps-15-i7-16gb-512gb' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['512GB SSD', '1TB SSD'], 2 FROM krestlogic_products WHERE slug = 'dell-xps-15-i7-16gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Chip', ARRAY['M3', 'M3 Pro', 'M3 Max'], 0 FROM krestlogic_products WHERE slug = 'apple-macbook-pro-14-m3-8gb-512gb' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Unified Memory', ARRAY['8GB', '18GB', '36GB'], 1 FROM krestlogic_products WHERE slug = 'apple-macbook-pro-14-m3-8gb-512gb' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['512GB', '1TB', '2TB'], 2 FROM krestlogic_products WHERE slug = 'apple-macbook-pro-14-m3-8gb-512gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Silver', 'Space Grey'], 0 FROM krestlogic_products WHERE slug = 'apple-mac-mini-m2-8gb-256gb' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Storage', ARRAY['256GB', '512GB', '1TB', '2TB'], 1 FROM krestlogic_products WHERE slug = 'apple-mac-mini-m2-8gb-256gb' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Platform', ARRAY['Windows', 'macOS', 'iOS', 'Android'], 0 FROM krestlogic_products WHERE slug = 'microsoft-365-personal-1yr' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Duration', ARRAY['1 Year'], 1 FROM krestlogic_products WHERE slug = 'microsoft-365-personal-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Edition', ARRAY['Home', 'Pro'], 0 FROM krestlogic_products WHERE slug = 'windows-11-pro-oem-key' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'License Type', ARRAY['OEM (1 PC)', 'Retail (Transferable)'], 1 FROM krestlogic_products WHERE slug = 'windows-11-pro-oem-key' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Devices', ARRAY['1', '3', '5', '10'], 0 FROM krestlogic_products WHERE slug = 'norton-360-deluxe-5dev-1yr' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Duration', ARRAY['1 Year', '2 Years'], 1 FROM krestlogic_products WHERE slug = 'norton-360-deluxe-5dev-1yr' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Switch Type', ARRAY['Razer Green (Clicky)', 'Razer Yellow (Silent)', 'Razer Orange (Tactile)'], 0 FROM krestlogic_products WHERE slug = 'razer-blackwidow-v3-tkl' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Black', 'White'], 1 FROM krestlogic_products WHERE slug = 'razer-blackwidow-v3-tkl' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['500GB', '1TB', '2TB'], 0 FROM krestlogic_products WHERE slug = 'samsung-t7-shield-2tb-ssd' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Color', ARRAY['Beige', 'Blue', 'Black'], 1 FROM krestlogic_products WHERE slug = 'samsung-t7-shield-2tb-ssd' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['500GB', '1TB', '2TB', '4TB'], 0 FROM krestlogic_products WHERE slug = 'samsung-990-pro-1tb-nvme' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Speed', ARRAY['DDR5-4800', 'DDR5-5600', 'DDR5-6000'], 0 FROM krestlogic_products WHERE slug = 'corsair-vengeance-32gb-ddr5-5600' ON CONFLICT DO NOTHING;
INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'Capacity', ARRAY['16GB (1×16GB)', '32GB (2×16GB)', '64GB (2×32GB)'], 1 FROM krestlogic_products WHERE slug = 'corsair-vengeance-32gb-ddr5-5600' ON CONFLICT DO NOTHING;

INSERT INTO krestlogic_product_attributes (product_id, name, options, position)
SELECT id, 'VRAM', ARRAY['8GB GDDR6'], 0 FROM krestlogic_products WHERE slug = 'asus-dual-rtx-4060-oc-8gb' ON CONFLICT DO NOTHING;

-- ── Update category product counts ───────────────────────────

UPDATE krestlogic_categories c
SET count = (
  SELECT COUNT(*) FROM krestlogic_product_categories pc WHERE pc.category_id = c.id
);
