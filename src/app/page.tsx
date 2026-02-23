import AppLayout from "@src/components/AppLayout";
import AllCategorySection from "@src/components/PageFragments/AllCategorySection";
import SortedProducts from "./(Home)/_components/SortedProducts";
import { SEODATA } from "@constants/seoContants";
import { Metadata } from "next";
import MachineMaintenance from "./(Home)/_components/MachineMaintenance";
import ServicesSection from "./(Home)/_components/ServicesSection";
import FaqAccordion from "@src/components/Reusables/Accordion/FaqAccordion";
import Link from "next/link";
import {
	FaFacebook,
	FaTwitter,
	FaInstagram,
	FaYoutube,
} from "react-icons/fa";
import { SiTiktok } from "react-icons/si";

const { description, title, ogImage, keywords } = SEODATA.home;
export const metadata: Metadata = {
	title: title,
	description: description,
	keywords: keywords,
	icons: ogImage,
	openGraph: {
		images: [
			{
				url: ogImage ?? "",
			},
		],
	},
};

const page = () => {
	return (
		<AppLayout>
			{/* ── 1. Hero + Announcement bar + Features strip ── */}
			<AllCategorySection />

			{/* ── 2. "We Make It Easy For You" + Products grid ── */}
			<MachineMaintenance />

			{/* ── 3. New Collection (live WooCommerce products) ── */}
			<section className='bg-gray-50 py-14 md:py-20'>
				<div className='max-w-[1440px] mx-auto px-4 sm:px-8'>
					<div className='text-center mb-10 space-y-2'>
						<span className='inline-block text-black text-xs font-bold uppercase tracking-widest border border-shop/30 px-3 py-1 rounded-full'>
							Fresh Arrivals
						</span>
						<h2 className='text-3xl sm:text-4xl font-extrabold text-shop'>
							New Collection
						</h2>
						<p className='text-gray-500 text-sm max-w-md mx-auto'>
							Hand-picked gear landing in our store — browse the latest drops before they sell out.
						</p>
					</div>

					<SortedProducts />
				</div>
			</section>

			{/* ── 4. Our Services ── */}
			<ServicesSection />

			{/* ── 5. Guarantee Banner ── */}
			<section className='w-full bg-[#0b0f1a] overflow-hidden'>
				<div className='max-w-[1440px] mx-auto grid grid-cols-1 md:grid-cols-2 items-center min-h-[300px]'>
					{/* Left – copy */}
					<div className='px-8 sm:px-14 py-12 space-y-6'>
						<p className='text-shop text-xs font-bold uppercase tracking-widest'>
							Our Promise
						</p>
						<h2 className='text-2xl sm:text-3xl lg:text-4xl font-extrabold text-white leading-snug max-w-xs'>
							Products built to last at least 10 years.
						</h2>
						<p className='text-gray-400 text-sm leading-relaxed max-w-xs'>
							Every item ships with a full 2-year warranty and lifetime support
							from our technical team.
						</p>
						<Link
							href='/category'
							className='inline-block bg-shop hover:bg-shop-dark text-white text-xs font-bold px-8 py-3 uppercase tracking-widest transition-colors'
						>
							Shop All
						</Link>
					</div>

					{/* Right – image */}
					<div className='h-64 md:h-full overflow-hidden'>
						<img
							src='/images/hero-bg.png'
							alt='Premium product guarantee'
							className='w-full h-full object-cover opacity-80'
						/>
					</div>
				</div>
			</section>

			{/* ── 6. Contact / CTA ── */}
			<section className='relative overflow-hidden bg-[#F5F5F3] py-20 md:py-28'>

				{/* ─ Left brush-stroke decoration ─ */}
				<div className='pointer-events-none absolute left-0 top-0 h-full w-40 sm:w-56 overflow-hidden' aria-hidden>
					<svg viewBox='0 0 140 360' fill='none' xmlns='http://www.w3.org/2000/svg' className='absolute left-2 top-8 h-auto w-full opacity-80'>
						<line x1='8'  y1='24'  x2='38'  y2='10'  stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='18' y1='48'  x2='52'  y2='36'  stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='4'  y1='72'  x2='30'  y2='60'  stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='24' y1='94'  x2='60'  y2='80'  stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='10' y1='118' x2='44'  y2='106' stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='30' y1='140' x2='64'  y2='128' stroke='#E8948A' strokeWidth='2.5' strokeLinecap='round'/>
						<line x1='6'  y1='162' x2='36'  y2='152' stroke='#E8948A' strokeWidth='2.5' strokeLinecap='round'/>
						<line x1='20' y1='186' x2='54'  y2='172' stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='12' y1='208' x2='40'  y2='196' stroke='#E8948A' strokeWidth='2.5' strokeLinecap='round'/>
						<line x1='28' y1='230' x2='58'  y2='218' stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
						<line x1='5'  y1='254' x2='35'  y2='242' stroke='#E8948A' strokeWidth='2.5' strokeLinecap='round'/>
						<line x1='18' y1='276' x2='50'  y2='264' stroke='#E8948A' strokeWidth='3' strokeLinecap='round'/>
					</svg>
				</div>

				{/* ─ Right decorative shapes ─ */}
				<div className='pointer-events-none absolute right-0 top-0 h-full w-40 sm:w-56 overflow-hidden' aria-hidden>
					<svg viewBox='0 0 140 360' fill='none' xmlns='http://www.w3.org/2000/svg' className='absolute right-0 top-0 h-full w-full opacity-90'>
						{/* Diamonds */}
						<rect x='90' y='28'  width='10' height='10' transform='rotate(45 95 33)'  fill='#9CA3AF' opacity='0.6'/>
						<rect x='108' y='60' width='8'  height='8'  transform='rotate(45 112 64)' fill='#9CA3AF' opacity='0.5'/>
						<rect x='76'  y='80' width='7'  height='7'  transform='rotate(45 80 84)'  fill='#9CA3AF' opacity='0.4'/>
						<rect x='120' y='100' width='9' height='9'  transform='rotate(45 125 105)' fill='#9CA3AF' opacity='0.5'/>
						<rect x='88'  y='130' width='6' height='6'  transform='rotate(45 91 133)' fill='#9CA3AF' opacity='0.35'/>
						{/* Gold dots cluster */}
						<circle cx='100' cy='200' r='4' fill='#D4A017' opacity='0.7'/>
						<circle cx='115' cy='210' r='3' fill='#D4A017' opacity='0.6'/>
						<circle cx='105' cy='222' r='3.5' fill='#D4A017' opacity='0.65'/>
						<circle cx='120' cy='195' r='2.5' fill='#D4A017' opacity='0.5'/>
						<circle cx='95'  cy='215' r='2.5' fill='#D4A017' opacity='0.55'/>
						<circle cx='112' cy='232' r='2' fill='#D4A017' opacity='0.45'/>
						<circle cx='125' cy='225' r='3' fill='#D4A017' opacity='0.6'/>
						<circle cx='98'  cy='240' r='2' fill='#D4A017' opacity='0.4'/>
						<circle cx='118' cy='248' r='3' fill='#D4A017' opacity='0.55'/>
					</svg>
				</div>

				{/* ─ Center content ─ */}
				<div className='relative z-10 max-w-lg mx-auto px-6 text-center flex flex-col items-center gap-6'>
					<h2 className='text-3xl sm:text-4xl lg:text-5xl font-extrabold leading-tight' style={{ color: '#8AA3A0' }}>
						Feel Free To Contact Us
					</h2>

					<p className='text-gray-500 text-sm leading-relaxed'>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo
						enim sit amet magna semper lacinia. Lorem ipsum dolor sit amet,
					</p>

					{/* Social icons */}
					<div className='flex items-center gap-5'>
						{[
							{ icon: FaFacebook,  href: '#', label: 'Facebook'  },
							{ icon: FaTwitter,   href: '#', label: 'Twitter'   },
							{ icon: FaInstagram, href: '#', label: 'Instagram' },
							{ icon: SiTiktok,    href: '#', label: 'TikTok'    },
							{ icon: FaYoutube,   href: '#', label: 'YouTube'   },
						].map(({ icon: Icon, href, label }) => (
							<Link
								key={label}
								href={href}
								aria-label={label}
								className='text-gray-700 hover:text-[#8AA3A0] transition-colors'
							>
								<Icon className='text-xl sm:text-2xl' />
							</Link>
						))}
					</div>

					<Link
						href='/contact-us'
						className='border border-gray-400 hover:border-[#8AA3A0] hover:text-[#8AA3A0] text-gray-700 text-sm font-medium px-8 py-2.5 transition-colors'
					>
						Contact us
					</Link>
				</div>
			</section>

			{/* ── 7. FAQ ── */}
			<section className='bg-gray-50 py-14 md:py-20'>
				<div className='max-w-[1440px] mx-auto px-4 sm:px-8'>
					<div className='text-center mb-8 space-y-2'>
						<span className='inline-block text-shop text-xs font-bold uppercase tracking-widest border border-shop/30 px-3 py-1 rounded-full'>
							FAQ
						</span>
						<h3 className='font-extrabold text-2xl sm:text-3xl text-gray-900'>
							Frequently Asked Questions
						</h3>
					</div>
					<FaqAccordion />
				</div>
			</section>

		</AppLayout>
	);
};

export default page;
