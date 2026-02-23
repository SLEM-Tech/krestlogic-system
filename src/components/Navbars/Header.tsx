"use client";
import React, { useMemo, useState, useTransition, Fragment } from "react";
import { usePathname, useRouter } from "next/navigation";
import Link from "next/link";
import { useCart } from "react-use-cart";
import { useAppDispatch, useAppSelector } from "../hooks";
import Drawer from "rc-drawer";
import { useCustomer } from "../lib/woocommerce";
import { currencyOptions, filterCustomersByEmail } from "@constants";
import { signOut } from "@utils/lib";
import Picture from "../picture/Picture";
import { APICall } from "@utils";
import { fetchExchangeRate } from "@utils/endpoints";
import { setBaseCurrency, setExchangeRate } from "../Redux/Currency";
import FormToast from "../Reusables/Toast/SigninToast";
import useToken from "../hooks/useToken";

import { Menu, Transition } from "@headlessui/react";
import {
	FiSearch,
	FiShoppingBag,
	FiUser,
	FiLogOut,
	FiMenu,
	FiShoppingCart,
} from "react-icons/fi";
import { SlArrowDown } from "react-icons/sl";
import Flag from "react-world-flags";
import GlobalLoader from "../modal/GlobalLoader";
import MobileNav from "./MobileNav";
import ProductTable from "../Tables/ProductTable";
import CategoryPageBottomHeader from "./CategoryPageBottomHeader";
import ProductPageBottomHeader from "./ProductPageBottomHeader";
import { FaCartArrowDown } from "react-icons/fa";
import { BiUser } from "react-icons/bi";

const HEADER_BG = "bg-[#393933]";

const desktopNavLinks = [
	{ id: 1, href: "/", label: "Home" },
	{ id: 2, href: "/about", label: "About Us" },
	{ id: 3, href: "/category", label: "Products" },
	{ id: 4, href: "/contact-us", label: "Workshops" },
];

const Header = () => {
	const pathname = usePathname();
	const router = useRouter();
	const dispatch = useAppDispatch();
	const { email } = useToken();
	const { totalItems } = useCart();

	const { baseCurrency } = useAppSelector((state) => state.currency);
	const [isPending, startTransition] = useTransition();

	const [isCartOpen, setIsCartOpen] = useState(false);
	const [drawerVisible, setDrawerVisible] = useState(false);
	const [searchOpen, setSearchOpen] = useState(false);
	const [searchValue, setSearchValue] = useState("");

	const { data: customer } = useCustomer("");
	const wc_customer_info = useMemo(
		() => filterCustomersByEmail(customer as Woo_Customer_Type[], email),
		[customer, email],
	);

	const onOpenCart = () => setIsCartOpen(true);
	const onCloseCart = () => setIsCartOpen(false);

	const handleCurrencyChange = async (code: string) => {
		const selectedObj = currencyOptions.find((c) => c.code === code);
		if (!selectedObj) return;
		try {
			const data = await APICall(fetchExchangeRate, ["NGN", code], true, true);
			if (data) {
				dispatch(setExchangeRate(data));
				dispatch(setBaseCurrency(selectedObj));
				FormToast({ message: `Switched to ${code}`, success: true });
			}
		} catch (error) {
			FormToast({ message: "Currency switch failed", success: false });
		}
	};

	const handleSearch = () => {
		if (!searchValue) return;
		startTransition(() => {
			router.push(`/search?${searchValue}`);
		});
	};

	const userDropDownLinks = [
		{ id: 1, href: "/user/dashboard", icon: <BiUser />, label: "My Account" },
		{
			id: 2,
			href: "/user/my-orders",
			icon: <FaCartArrowDown />,
			label: "Orders",
		},
		{ id: 3, onClick: onOpenCart, icon: <FiShoppingCart />, label: "Cart" },
	];

	const isOnCategoryPage = pathname.includes("/category");
	const isOnProductPage = pathname.includes("/home-item");

	return (
		<>
			<header className={`flex flex-col w-full z-[100] fixed top-0 ${HEADER_BG} transition-all`}>
				{/* ── DESKTOP HEADER ── */}
				<div className='hidden slg:flex items-center w-full'>
					<div className='max-w-[1440px] mx-auto w-full flex items-center justify-between px-8 py-4'>

						{/* Logo */}
						<Link href='/' className='flex-shrink-0 flex items-center gap-2.5'>
							<Picture
								src='/images/logo-tiny.svg'
								alt='apppopper systems'
								width={36}
								height={36}
								className='h-9 w-9 shrink-0'
							/>
							<span className='text-base font-black text-white tracking-tight leading-none'>
								<span className='text-shop'>a</span>pppopper
								<span className='block text-[9px] text-white/40 font-medium tracking-widest uppercase'>
									systems
								</span>
							</span>
						</Link>

						{/* Nav links */}
						<nav className='flex items-center gap-7'>
							{desktopNavLinks.map(({ id, href, label }) => {
								const isActive = pathname === href;
								return (
									<Link
										key={id}
										href={href}
										className={`text-xs font-medium tracking-wide transition-colors ${
											isActive
												? "text-white"
												: "text-white/60 hover:text-white"
										}`}
									>
										{label}
									</Link>
								);
							})}
						</nav>

						{/* Right actions */}
						<div className='flex items-center gap-2'>
							{/* Search toggle */}
							<div className='relative flex items-center'>
								{searchOpen && (
									<input
										autoFocus
										type='text'
										placeholder='Search…'
										className='absolute right-8 w-48 h-8 text-xs bg-white/10 border border-white/20 rounded-md pl-3 pr-3 outline-none text-white placeholder-white/40 focus:border-white/50 transition-all'
										value={searchValue}
										onChange={(e) => setSearchValue(e.target.value)}
										onKeyDown={(e) => {
											if (e.key === "Enter") handleSearch();
											if (e.key === "Escape") setSearchOpen(false);
										}}
										onBlur={() => !searchValue && setSearchOpen(false)}
									/>
								)}
								<button
									onClick={() => setSearchOpen((p) => !p)}
									className='p-2 text-white/70 hover:text-white transition-colors'
								>
									<FiSearch className='text-[18px]' />
								</button>
							</div>

							{/* Currency */}
							<Menu as='div' className='relative inline-block text-left'>
								{({ open }) => (
									<>
										<Menu.Button className='flex items-center gap-1 text-white/60 hover:text-white transition-colors outline-none py-2 px-1'>
											{/* @ts-ignore */}
											<Flag
												code={baseCurrency?.countryCode || "NG"}
												className='w-4 rounded-sm'
											/>
											<span className='text-[10px] uppercase font-semibold'>
												{baseCurrency.code}
											</span>
											<SlArrowDown
												className={`text-[7px] transition-transform duration-200 ${open ? "rotate-180" : ""}`}
											/>
										</Menu.Button>
										<Transition
											as={Fragment}
											enter='transition ease-out duration-100'
											enterFrom='transform opacity-0 scale-95'
											enterTo='transform opacity-100 scale-100'
											leave='transition ease-in duration-75'
											leaveFrom='transform opacity-100 scale-100'
											leaveTo='transform opacity-0 scale-95'
										>
											<Menu.Items className='absolute right-0 mt-2 w-36 origin-top-right bg-[#393933] border border-white/10 rounded-xl shadow-2xl p-1 z-[110] outline-none'>
												{currencyOptions.map((c) => (
													<Menu.Item key={c.code}>
														{({ active }) => (
															<button
																onClick={() => handleCurrencyChange(c.code)}
																className={`${active ? "bg-white/10 text-white" : "text-white/60"} flex w-full items-center gap-2 rounded-lg px-3 py-2 text-xs font-medium transition-colors`}
															>
																{/* @ts-ignore */}
																<Flag code={c.countryCode} className='w-4' />
																{c.code} ({c.symbol})
															</button>
														)}
													</Menu.Item>
												))}
											</Menu.Items>
										</Transition>
									</>
								)}
							</Menu>

							{/* Cart */}
							<button
								onClick={onOpenCart}
								className='relative p-2 text-white/70 hover:text-white transition-colors'
							>
								<FiShoppingBag className='text-[20px]' />
								{totalItems > 0 && (
									<span className='absolute top-0.5 right-0.5 size-[16px] bg-shop text-white text-[9px] font-black flex items-center justify-center rounded-full'>
										{totalItems}
									</span>
								)}
							</button>

							{/* Account */}
							<Menu as='div' className='relative inline-block text-left'>
								{({ open }) => (
									<>
										<Menu.Button className='flex items-center gap-1 cursor-pointer outline-none p-1'>
											<div className='size-7 rounded-full bg-white/10 flex items-center justify-center overflow-hidden border border-white/20'>
												{wc_customer_info?.shipping?.address_2 ? (
													<Picture
														src={wc_customer_info.shipping.address_2}
														alt='user'
														className='size-7 rounded-full object-cover'
														width={28}
														height={28}
													/>
												) : (
													<FiUser className='text-white/70 text-xs' />
												)}
											</div>
											<SlArrowDown
												className={`text-[7px] text-white/40 transition-transform duration-200 ${open ? "rotate-180" : ""}`}
											/>
										</Menu.Button>
										<Transition
											as={Fragment}
											enter='transition ease-out duration-100'
											enterFrom='transform opacity-0 scale-95'
											enterTo='transform opacity-100 scale-100'
											leave='transition ease-in duration-75'
											leaveFrom='transform opacity-100 scale-100'
											leaveTo='transform opacity-0 scale-95'
										>
											<Menu.Items className='absolute right-0 mt-2 w-52 origin-top-right bg-[#393933] border border-white/10 rounded-2xl shadow-2xl p-1.5 z-[110] outline-none'>
												{wc_customer_info?.first_name && (
													<div className='px-3 py-2 mb-1 border-b border-white/10'>
														<p className='text-[10px] text-white/40'>Logged in as</p>
														<p className='text-xs font-bold text-white truncate'>
															{wc_customer_info.first_name}
														</p>
													</div>
												)}
												{userDropDownLinks.map((item) => (
													<Menu.Item key={item.id}>
														{({ active }) => (
															<button
																onClick={(e) => {
																	if (item.onClick) {
																		e.preventDefault();
																		item.onClick();
																	} else if (item.href) {
																		router.push(item.href);
																	}
																}}
																className={`${active ? "bg-white/10 text-white" : "text-white/60"} flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-xs transition-colors`}
															>
																<span>{item.icon}</span>
																{item.label}
															</button>
														)}
													</Menu.Item>
												))}
												<Menu.Item>
													{({ active }) => (
														<button
															onClick={() => signOut()}
															className={`${active ? "bg-red-900/30" : ""} flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-xs text-red-400 font-semibold transition-colors mt-0.5`}
														>
															<FiLogOut /> Log Out
														</button>
													)}
												</Menu.Item>
											</Menu.Items>
										</Transition>
									</>
								)}
							</Menu>

							{/* Contact CTA */}
							<Link
								href='/contact-us'
								className='ml-2 border border-white/40 hover:border-white text-white text-[11px] font-semibold px-5 py-2 transition-colors'
							>
								Contact
							</Link>
						</div>
					</div>
				</div>

				{/* Conditional sub-headers for category / product pages */}
				{isOnCategoryPage && <CategoryPageBottomHeader />}
				{isOnProductPage && <ProductPageBottomHeader />}

				{/* ── MOBILE HEADER ── */}
				<div className='slg:hidden flex flex-col w-full'>
					<div className='flex items-center justify-between px-4 py-3'>
						<div className='flex items-center gap-3'>
							<button
								onClick={() => setDrawerVisible(true)}
								className='p-1 -ml-1'
							>
								<FiMenu className='text-[22px] text-white' />
							</button>
							<Link href='/' className='flex items-center gap-2'>
								<Picture
									src='/images/logo-tiny.svg'
									alt='apppopper systems'
									width={32}
									height={32}
									className='h-8 w-8 shrink-0'
								/>
								<span className='text-sm font-black text-white tracking-tight leading-none'>
									<span className='text-shop'>a</span>pppopper
									<span className='block text-[8px] text-white/40 font-medium tracking-widest uppercase'>
										systems
									</span>
								</span>
							</Link>
						</div>

						{/* Right: account + cart */}
						<div className='flex items-center gap-1'>
							<button
								onClick={() =>
									router.push(
										wc_customer_info?.first_name
											? "/user/dashboard"
											: "/user/login",
									)
								}
								className='relative p-2 rounded-full hover:bg-white/10 transition-colors'
							>
								{wc_customer_info?.shipping?.address_2 ? (
									<Picture
										src={wc_customer_info.shipping.address_2}
										alt='user'
										className='size-[22px] rounded-full object-cover'
										width={22}
										height={22}
									/>
								) : (
									<FiUser className='text-[20px] text-white/80' />
								)}
							</button>

							<button
								onClick={onOpenCart}
								className='relative p-2 rounded-full hover:bg-white/10 transition-colors'
							>
								<FiShoppingBag className='text-[20px] text-white/80' />
								{totalItems > 0 && (
									<span className='absolute top-0.5 right-0.5 size-4 bg-shop rounded-full text-[9px] flex items-center justify-center text-white font-bold'>
										{totalItems}
									</span>
								)}
							</button>
						</div>
					</div>

					{/* Search bar */}
					<div className='px-4 pb-3'>
						<div className='relative'>
							<FiSearch className='absolute left-3 top-1/2 -translate-y-1/2 text-white/40 text-sm pointer-events-none z-10' />
							<input
								type='text'
								placeholder='Search'
								className='w-full h-9 text-sm bg-white/10 border border-white/20 rounded-lg pl-9 pr-4 outline-none text-white placeholder-white/40 focus:border-white/50 transition-colors'
								value={searchValue}
								onChange={(e) => setSearchValue(e.target.value)}
								onKeyDown={(e) => e.key === "Enter" && handleSearch()}
							/>
						</div>
					</div>
				</div>
			</header>

			{/* Cart Drawer */}
			<Drawer
				open={isCartOpen}
				onClose={onCloseCart}
				placement='right'
				width={
					typeof window !== "undefined" && window.innerWidth > 768 ? 500 : "100%"
				}
			>
				<ProductTable onClose={onCloseCart} />
			</Drawer>

			<GlobalLoader isPending={isPending} />
			<MobileNav
				closeDrawer={() => setDrawerVisible(false)}
				drawerVisible={drawerVisible}
			/>
		</>
	);
};

export default Header;
