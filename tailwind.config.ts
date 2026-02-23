import type { Config } from "tailwindcss";
import { heroui } from "@heroui/react";

const config: Config = {
	content: [
		"./src/pages/**/*.{js,ts,jsx,tsx,mdx}",
		"./src/components/**/*.{js,ts,jsx,tsx,mdx}",
		"./src/app/**/*.{js,ts,jsx,tsx,mdx}",
		// Updated to heroui path
		"./node_modules/@heroui/theme/dist/**/*.{js,ts,jsx,tsx}",
	],
	theme: {
		extend: {
			fontFamily: {
				poppins: ["var(--font-poppins)", "sans-serif"],
			},
			colors: {
				transparent: "transparent",
				current: "currentColor",

				/* ========== Nestora Brand Foundation ========== */
				// The deep navy blue seen in the "Maintenance" banner
				brand: {
					navy: "#002D5B",
					blue: "#004B93", // Standard blue for buttons/icons
					light: "#E6F0F9", // Light blue for hover states/bg
				},

				background: "#FFFFFF", // Main site background
				surface: "#FFFFFF", // Product cards
				panel: "#FDFBFA", // The soft off-white/beige "Services" section
				dark: "#0A0A0A", // For high-contrast text and footers

				// Shop primary – muted teal-green
				shop: {
					DEFAULT: "#8AA3A0",
					dark: "#6B8E8B",
					light: "#e8f0ef",
				},

				primary: {
					100: "#8AA3A0",
					200: "#6B8E8B",
					300: "#5a7a77",
					400: "#4a6663",
					DEFAULT: "#8AA3A0",
				},

				// Tech-focused Grays
				gray: {
					50: "#F9FAFB",
					100: "#F3F4F6",
					200: "#E5E7EB",
					300: "#D1D5DB",
					400: "#9CA3AF",
					500: "#6B7280",
					600: "#4B5563",
					700: "#374151",
					800: "#1F2937",
					900: "#111827",
				},

				// Standard E-commerce feedback colors
				success: {
					light: "#E6F9F0",
					DEFAULT: "#10B981",
					dark: "#059669",
				},
				danger: {
					light: "#FEF2F2",
					DEFAULT: "#EF4444",
					dark: "#DC2626",
				},

				// Accents
				accent: "#8AA3A0",
				price: "#1a1a1a", // Dark for price text
				whatsapp: "#25D366",
			},

			animation: {
				"spin-slow": "spin 8s linear infinite",
				"fade-in": "fadeIn 0.5s ease-in-out",
			},
			keyframes: {
				fadeIn: {
					"0%": { opacity: "0" },
					"100%": { opacity: "1" },
				},
			},
		},
		screens: {
			xs: "400px",
			xmd: "800px",
			slg: "999px",
			...require("tailwindcss/defaultTheme").screens,
		},
	},
	darkMode: "class",
	plugins: [
		heroui({
			themes: {
				light: {
					colors: {
						primary: {
							DEFAULT: "#8AA3A0",
							foreground: "#FFFFFF",
						},
						focus: "#6B8E8B",
					},
				},
			},
		}),
	],
};
export default config;
