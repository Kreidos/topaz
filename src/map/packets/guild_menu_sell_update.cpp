﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "../../common/socket.h"

#include <cstring>

#include "guild_menu_sell_update.h"

#include "../entities/charentity.h"
#include "../item_container.h"

#include "../items/item_shop.h"

CGuildMenuSellUpdatePacket::CGuildMenuSellUpdatePacket(CCharEntity* PChar, uint8 stock, uint16 itemID, uint8 quantity)
{
    this->type = 0x84;
    this->size = 0x04;

    TPZ_DEBUG_BREAK_IF(PChar == nullptr);

    ref<uint16>(0x04) = itemID;
    ref<uint8>(0x06)  = stock;
    ref<uint8>(0x07)  = quantity;
}
