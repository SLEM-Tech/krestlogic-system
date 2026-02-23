"use client";
import Link from "next/link";
import Picture from "../picture/Picture";
import { HiShieldCheck } from "react-icons/hi";
import { MdLocalShipping, MdOutlineHeadsetMic } from "react-icons/md";

/* Four-pointed star SVG sparkle */
const Sparkle = ({
	size = 14,
	className = "",
}: {
	size?: number;
	className?: string;
}) => (
	<svg
		width={size}
		height={size}
		viewBox='0 0 24 24'
		fill='white'
		className={className}
		aria-hidden
	>
		<path d='M12 0 L13.5 10.5 L24 12 L13.5 13.5 L12 24 L10.5 13.5 L0 12 L10.5 10.5 Z' />
	</svg>
);

const AllCategorySection = () => {
	return (
		<div>
			{/* ── Hero ── */}
			<section
				className='relative bg-[#393933] overflow-hidden'
				style={{ minHeight: "calc(100vh - 68px)" }}
			>
				<div className='grid grid-cols-1 slg:grid-cols-2 min-h-[inherit]'>

					{/* Left: text content */}
					<div className='flex flex-col justify-center px-8 sm:px-12 lg:px-16 py-20 slg:py-28 space-y-6'>
						{/* Eyebrow */}
						<span className='text-[10px] sm:text-xs tracking-[0.35em] uppercase text-white/40 font-medium'>
							Objects of Desire
						</span>

						{/* Heading */}
						<h1
							className='text-4xl sm:text-5xl lg:text-[3.25rem] font-extrabold leading-[1.1] tracking-tight'
							style={{ color: "#8AA3A0" }}
						>
							You Will Love
							<br />
							This Awesome
							<br />
							Handcraft
						</h1>

						{/* Description */}
						<p className='text-white/50 text-sm leading-relaxed max-w-sm'>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. In commodo
							enim sit amet magna semper lacinia. Lorem ipsum dolor sit amet,
							consectetur adipiscing elit. In commodo enim sit amet.
						</p>

						{/* CTA */}
						<div>
							<Link
								href='/category'
								className='inline-block border border-white/30 hover:border-white text-white text-xs font-medium px-8 py-2.5 transition-colors'
							>
								Explore
							</Link>
						</div>
					</div>

					{/* Right: full-height product image (desktop) */}
					<div className='relative hidden slg:block'>
						<Picture
							src='/images/hero-bg.png'
							alt='Featured product'
							className='absolute inset-0 w-full h-full object-cover'
						/>
						{/* Sparkle decorations */}
						<Sparkle size={16} className='absolute top-[28%] left-[38%]' />
						<Sparkle size={12} className='absolute top-[55%] left-[12%]' />
						<Sparkle size={10} className='absolute top-[58%] right-[22%]' />
					</div>
				</div>

				{/* Mobile: stacked image below text */}
				<div className='slg:hidden w-full h-64 relative'>
					<Picture
						src='/images/hero-bg.png'
						alt='Featured product'
						className='absolute inset-0 w-full h-full object-cover'
					/>
				</div>
			</section>

			{/* ── Features Strip ── */}
			<section className='bg-white border-b border-gray-100'>
				<div className='max-w-[1440px] mx-auto px-4 sm:px-8 py-6 grid grid-cols-2 md:grid-cols-4'>
					{[
						{ Icon: HiShieldCheck,       title: "High Quality",        sub: "Crafted from top materials" },
						{ Icon: HiShieldCheck,       title: "Warranty Protection", sub: "Over 2 years guarantee"    },
						{ Icon: MdLocalShipping,     title: "Free Shipping",       sub: "Order over $50"            },
						{ Icon: MdOutlineHeadsetMic, title: "24/7 Support",        sub: "Dedicated support"         },
					].map(({ Icon, title, sub }, i) => (
						<div
							key={title}
							className={`flex flex-col sm:flex-row items-center sm:items-start gap-3 px-4 py-5 text-center sm:text-left ${i > 0 ? "border-l border-gray-100" : ""}`}
						>
							<span className='flex-shrink-0 w-10 h-10 rounded-full bg-shop/10 flex items-center justify-center'>
								<Icon className='text-shop text-lg' />
							</span>
							<div>
								<p className='font-semibold text-gray-900 text-sm'>{title}</p>
								<p className='text-gray-500 text-xs mt-0.5'>{sub}</p>
							</div>
						</div>
					))}
				</div>
			</section>
		</div>
	);
};

export default AllCategorySection;
