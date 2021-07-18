local function GetCoinTextureString(value)
	local copper, silver, gold, calc, ccoin, scoin, gcoin
	copper = (("%d"):format(value % 100))
	silver = (("%d"):format((value / 100) % 100))	
	gold = (("%d"):format(value / 100 / 100))
	calc = FormatLargeNumber(gold)
	ccoin = "|TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0|t "	
	scoin = "|TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0|t "	
	gcoin = "|TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0|t "		
	return (calc..gcoin..silver..scoin..copper..ccoin)
end

_G.GetCoinTextureString = GetCoinTextureString;