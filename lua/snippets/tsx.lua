local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local r = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

return {
	s("basefc", fmt(
		[[
import React from 'react';
import {{
	Box,
}} from '@chakra-ui/react/';

const {}: React.FC = () => {{
	return (
		<Box>{}</Box>
	);
}}

export default {}
	]],
	{
		i(1, "ComponentName"),
		i(2, "Content"),
		r(1)
	})
	),
};


