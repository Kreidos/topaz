/*
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

#include "roe_update.h"

#include "../entities/charentity.h"

CRoeUpdatePacket::CRoeUpdatePacket(CCharEntity* PChar)
{
	this->id(0x111);
	this->length(0x88);

	ref<uint8>(0x04) |= 1;

//    const char* query = "SELECT spark_of_eminence FROM char_points WHERE charid = %d";

//    int ret = Sql_Query(SqlHandle, query, PChar->id);
//    if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
//    {
//        ref<uint32>(0x04) = Sql_GetIntData(SqlHandle, 0);
//    }
}
