﻿/*
===========================================================================

  Copyright (c) 2020 - Kreidos | github.com/kreidos

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

#include "roe_sparkupdate.h"

#include "../entities/charentity.h"

CRoeSparkUpdatePacket::CRoeSparkUpdatePacket(CCharEntity* PChar)
{
	this->id(0x110);
	this->length(0x14);

    const char* query = "SELECT spark_of_eminence FROM char_points WHERE charid = %d";

    int ret = Sql_Query(SqlHandle, query, PChar->id);
    if (ret != SQL_ERROR && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
    {
        ref<uint32>(0x04) = Sql_GetIntData(SqlHandle, 0);
//        ref<uint16>(0x08) = 0x0;            // Deeds
//        ref<uint16>(0x0A) = 0xFF;           // Unknown but seems to be all 1's or all 0's
//        ref<uint16>(0x0C) = 0x0;            // Varies, possibly related to Unity Accolades
//        ref<uint32>(0x0E) = 0xFFFFFFFF;     // Unknown but always all 1's.
//        ref<uint16>(0x12) = 0xFFFF;         // Unknown but always all 1's.
    }
}
