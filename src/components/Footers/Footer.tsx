"use client";
import React, { useMemo } from "react";
import Image from "next/image";
import Link from "next/link";
import { signOut } from "@utils/lib";
import { CompanyName, filterCustomersByEmail } from "@constants";
import { useCustomer } from "../lib/woocommerce";
import useToken from "../hooks/useToken";
import {
	BiLogoFacebook,
	BiLogoInstagram,
	BiLogoTwitter,
} from "react-icons/bi";

const Footer = () => {
	const { email } = useToken();
	const currentYear = new Date().getFullYear();

	const { data: customer } = useCustomer("");
	const wc_customer_info: Woo_Customer_Type | undefined = useMemo(
		() => filterCustomersByEmail(customer as Woo_Customer_Type[], email),
		[customer, email],
	);

	const firstName = wc_customer_info?.first_name;

	const shopLinks = [
		{ label: "Electronics", href: "/category" },
		{ label: "Computers", href: "/category" },
		{ label: "Accessories", href: "/category" },
		{ label: "All Products", href: "/category" },
	];

	const supportLinks = [
		{ label: "FAQs", href: "/faq" },
		{ label: "Contact Us", href: "/contact-us" },
		{ label: "Terms of Use", href: "/terms-of-use?terms-of-use" },
		{ label: "Privacy Policy", href: "/terms-of-use?privacy-policy" },
	];

	const socialLinks = [
		{ label: "Facebook", icon: <BiLogoFacebook className='text-base' />, href: "#" },
		{ label: "Twitter", icon: <BiLogoTwitter className='text-base' />, href: "#" },
		{ label: "Instagram", icon: <BiLogoInstagram className='text-base' />, href: "#" },
	];

	return (
		<footer className='bg-[#111111] text-white w-full'>
			{/* ── Main footer columns ── */}
			<div className='max-w-[1440px] mx-auto px-4 sm:px-8 py-12 grid grid-cols-2 md:grid-cols-4 gap-8'>
				{/* Column 1 – Brand */}
				<div className='col-span-2 md:col-span-1 space-y-4'>
					<Link href='/' className='flex items-center gap-2'>
						<Image
							src='/images/logo-tiny.svg'
							alt={CompanyName}
							width={36}
							height={36}
							className='h-9 w-9 shrink-0'
						/>
						<span className='text-lg font-black text-white tracking-tight leading-none'>
							<span className='text-shop'>a</span>pppopper
							<span className='block text-[10px] text-gray-400 font-medium tracking-widest uppercase'>
								systems
							</span>
						</span>
					</Link>
					<p className='text-sm text-gray-400 leading-relaxed max-w-xs'>
						Your trusted destination for quality tech accessories and electronics
						delivered nationwide.
					</p>
				</div>

				{/* Column 2 – Shop */}
				<div className='space-y-3'>
					<h3 className='text-sm font-bold text-white uppercase tracking-wide'>
						Shop
					</h3>
					{shopLinks.map((link) => (
						<Link
							key={link.label}
							href={link.href}
							className='block text-sm text-gray-400 hover:text-white transition-colors leading-relaxed'
						>
							{link.label}
						</Link>
					))}
				</div>

				{/* Column 3 – Support */}
				<div className='space-y-3'>
					<h3 className='text-sm font-bold text-white uppercase tracking-wide'>
						Support
					</h3>
					{supportLinks.map((link) => (
						<Link
							key={link.label}
							href={link.href}
							className='block text-sm text-gray-400 hover:text-white transition-colors leading-relaxed'
						>
							{link.label}
						</Link>
					))}
					{firstName && (
						<button
							onClick={signOut}
							className='block text-sm text-red-400 hover:text-red-300 transition-colors text-left'
						>
							Log Out
						</button>
					)}
				</div>

				{/* Column 4 – Follow us */}
				<div className='space-y-3'>
					<h3 className='text-sm font-bold text-white uppercase tracking-wide'>
						Follow us
					</h3>
					{socialLinks.map((s) => (
						<a
							key={s.label}
							href={s.href}
							className='flex items-center gap-2 text-sm text-gray-400 hover:text-white transition-colors'
						>
							{s.icon}
							{s.label}
						</a>
					))}
				</div>
			</div>

			{/* ── Bottom bar ── */}
			<div className='border-t border-gray-800'>
				<div className='max-w-[1440px] mx-auto px-4 sm:px-8 py-4 flex flex-col sm:flex-row items-center justify-between gap-3'>
					<p className='text-xs text-gray-500'>
						Copyright &copy; {currentYear}
					</p>
					<div className='flex items-center gap-4'>
						<Link
							href='/terms-of-use?terms-of-use'
							className='text-xs text-gray-500 hover:text-gray-300 transition-colors'
						>
							Terms &amp; Conditions
						</Link>
						<Link
							href='/terms-of-use?privacy-policy'
							className='text-xs text-gray-500 hover:text-gray-300 transition-colors'
						>
							Privacy Policy
						</Link>
					</div>
				</div>
			</div>
		</footer>
	);
};

export default Footer;
