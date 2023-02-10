-------------- Theme Colors Solid ---------------

return {
	palette = function(ground, variat)
		if ground == 'dark' then
			if variat == 'purple' then
				return {
					[1]  = '#232135', -- floor
					[2]  = '#34314E', -- "
					[3]  = '#454263', -- "
					[4]  = '#575378', -- "
					[5]  = '#BEBCD0', -- ceil
					[6]  = '#D5D3E9', -- "
					[7]  = '#EBE9FF', -- "
					[8]  = '#8CCED9', -- cyan
					[9]  = '#4AB2C9', -- blue
					[10] = '#3C8EC9', -- "
					[11] = '#FD7FC3', -- "
					[12] = '#F46D93', -- red
					[13] = '#F8A796', -- orange
					[14] = '#F6D392', -- yellow
					[15] = '#BEE989', -- green
					[16] = '#CCA9F3', -- magenta
				}
			end
		end
		if ground == 'light' then
			if variat == 'purple' then
				return {
					[1]  = '#F2E2FF', -- floor
					[2]  = '#DBCDE7', -- "
					[3]  = '#C8BCD2', -- "
					[4]  = '#B1A4BB', -- "
					[5]  = '#2F2135', -- ceil
					[6]  = '#493B57', -- "
					[7]  = '#675777', -- "
					[8]  = '#8CCED9', -- cyan
					[9]  = '#4AB2C9', -- blue
					[10] = '#3C8EC9', -- "
					[11] = '#FD7FC3', -- "
					[12] = '#F46D93', -- red
					[13] = '#F8A796', -- orange
					[14] = '#F6D392', -- yellow
					[15] = '#BEE989', -- green
					[16] = '#CCA9F3', -- magenta
				}
			end
		end
	end
}
