/* Copyright (C) 2012 Kevin W. Hamlen
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 *
 * The latest version of this program can be obtained from
 * http://songs.sourceforge.net.
 */

#ifndef SONGIDX_H
#define SONGIDX_H

#if HAVE_CONFIG_H
#  include "config.h"
#else
#  include "vsconfig.h"
#endif

#include "chars.h"

/* A SONGENTRY struct consists of three fields:
 *   title: a string representing the title of the song
 *   num: a string representing the song's number in the book (might be
 *        something like "H10")
 *   linkname: a string denoting the internal hyperlink label for this song
 *   idx: a unique integer key that should be used to sort songs with
 *        identical titles */
typedef struct
{
  WCHAR *title;
  WCHAR *num;
  WCHAR *linkname;
  int idx;
}
SONGENTRY;

/* The following functions are in songsort.c */
extern void skipesc(const WCHAR **p);
extern int songcmp(const void *s1, const void *s2);

#endif
