local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

return {
	s("jsx-compo-base", fmt(
		[[
import * as React from 'react';
import {{
	// === Inputs ===
	Button,
	Checkbox,
	Fab,
	Switch,
	// ===------===
	// === Data Display ===
	Badge,
	Divider,
	List, ListItem, ListItemButton, ListItemIcon, ListItemText,
	Table, TableBody, TableCell, TableContainer, TableHead, TableRow,
	Tooltip,
	Typography,
	// ===------===
	// === Surfaces ===
	AppBar,	Toolbar,
	Card, CardContent,
	// ===------===
	// === Layout ===
	Box,
	Drawer,
	Grid,
	Menu,
	Stack,
	Tab, Tabs,
	// ===------===
	// === Feedback ===
	Dialog, DialogTitle,
	CircularProgress, LinearProgress,
	Skeleton,
	Snackbar,
	// ===------===
}} from '@mui/material/';

export default function {}() {{
	return (
		<Box>{}</Box>
	);
}}
	]],
	{
		i(1, "ComponentName"),
		i(2, "Content")
	})
	),
};


