-------------- Theme Colors Monokai ---------------

return {
	palette = function(ground, variat)
		if ground == 'dark' then
			if variat == 'classic' then
				return {
					[1]  = '#272822', -- floor
					[2]  = '#3A3C34', -- "
					[3]  = '#494A41', -- "
					[4]  = '#616359', -- "
					[5]  = '#CACBB9', -- ceil
					[6]  = '#E1E2CA', -- "
					[7]  = '#FDFFE0', -- "
					[8]  = '#66EFC6', -- cyan
					[9]  = '#66D9EF', -- blue
					[10] = '#6686ef', -- "
					[11] = '#ef66bf', -- "
					[12] = '#F92672', -- red
					[13] = '#FD971F', -- orange
					[14] = '#E6DB74', -- yellow
					[15] = '#A6E22E', -- green
					[16] = '#AE81FF', -- magenta
				}
			end

			if variat == 'default' then
				return {
					[1]  = '#2D2A2E', -- floor
					[2]  = '#433F44', -- "
					[3]  = '#555056', -- "
					[4]  = '#6D686F', -- "
					[5]  = '#CECECE', -- ceil
					[6]  = '#E7E7E7', -- "
					[7]  = '#FCFCFA', -- "
					[8]  = '#78E8C0', -- cyan
					[9]  = '#78DCE8', -- blue
					[10] = '#78b7e8', -- "
					[11] = '#ff61d0', -- "
					[12] = '#FF6188', -- red
					[13] = '#FC9867', -- orange
					[14] = '#FFD866', -- yellow
					[15] = '#A7DC76', -- green
					[16] = '#AB9DF2', -- magenta
				}
			end

			if variat == 'octagon' then
				return {
					[1]  = '#282A3A', -- floor
					[2]  = '#3B3E53', -- "
					[3]  = '#4A4D63', -- "
					[4]  = '#5D5F75', -- "
					[5]  = '#C7CECD', -- ceil
					[6]  = '#DAE1E0', -- "
					[7]  = '#EAF2F1', -- "
					[8]  = '#8FE2C0', -- cyan
					[9]  = '#91DADF', -- blue
					[10] = '#91bcdf', -- "
					[11] = '#ff65b2', -- "
					[12] = '#FF657A', -- red
					[13] = '#FF9B5E', -- orange
					[14] = '#FFD76D', -- yellow
					[15] = '#BAD761', -- green
					[16] = '#C39AC9', -- magenta
				}
			end

			if variat == 'ristretto' then
				return {
					[1]  = '#2C2525', -- floor
					[2]  = '#3F3535', -- "
					[3]  = '#584B4B', -- "
					[4]  = '#746666', -- "
					[5]  = '#CEC3C5', -- ceil
					[6]  = '#E4D7D9', -- "
					[7]  = '#FFF1F3', -- "
					[8]  = '#85DAB6', -- cyan
					[9]  = '#85DAD5', -- blue
					[10] = '#85b9da', -- "
					[11] = '#fd68b5', -- "
					[12] = '#FD6883', -- red
					[13] = '#F38D70', -- orange
					[14] = '#F9CC6C', -- yellow
					[15] = '#ADDA78', -- green
					[16] = '#A8A9EB', -- magenta
				}
			end

			if variat == 'spectrum' then
				return {
					[1]  = '#222222', -- floor
					[2]  = '#333333', -- "
					[3]  = '#474747', -- "
					[4]  = '#626262', -- "
					[5]  = '#C9C5CF', -- ceil
					[6]  = '#E1DCE8', -- "
					[7]  = '#F7F1FF', -- "
					[8]  = '#5AE6B4', -- cyan
					[9]  = '#5AD4E6', -- blue
					[10] = '#5aa5e6', -- "
					[11] = '#fc61c6', -- "
					[12] = '#FC618D', -- red
					[13] = '#FD9353', -- orange
					[14] = '#FCE566', -- yellow
					[15] = '#7BD88F', -- green
					[16] = '#948AE3', -- magenta
				}
			end

			if variat == 'machine' then
				return {
					[1]  = '#273136', -- floor
					[2]  = '#3B474D', -- "
					[3]  = '#526168', -- "
					[4]  = '#687880', -- "
					[5]  = '#BFCBC8', -- ceil
					[6]  = '#DAE7E4', -- "
					[7]  = '#F2FFFC', -- "
					[8]  = '#7CF1D5', -- cyan
					[9]  = '#7CD5F1', -- blue
					[10] = '#7cadf1', -- "
					[11] = '#ff6dc5', -- "
					[12] = '#FF6D7E', -- red
					[13] = '#FFB270', -- orange
					[14] = '#FFED72', -- yellow
					[15] = '#9CE37B', -- green
					[16] = '#BAA0F8', -- magenta
				}
			end
		end
		if ground == 'light' then
			return {
				[1]  = '#000000', -- floor
				[2]  = '#101010', -- "
				[3]  = '#202020', -- "
				[4]  = '#303030', -- "
				[5]  = '#404040', -- ceil
				[6]  = '#505050', -- "
				[7]  = '#606060', -- "
				[8]  = '#707070', -- blue
				[9]  = '#808080', -- cyan
				[10] = '#909090', -- "
				[11] = '#a0a0a0', -- "
				[12] = '#b0b0b0', -- red
				[13] = '#c0c0c0', -- orange
				[14] = '#d0d0d0', -- yellow
				[15] = '#e0e0e0', -- green
				[16] = '#f0f0f0', -- magenta
			}
		end
	end
}
