/* Kleinanzeigen Share URL only - An iOS tweak to omit text and query parameters when sharing items.
 * Copyright (C) 2024 Kleinanzeigen Share URL only Contributors
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */


#include <UIKit/UIActivityViewController.h>
#include <UIKit/UIActivityItemProvider.h>


%hook UIActivityViewController
// activityItems are actually of swift type KAKleinanzeigenKit.ShareServiceItemProvider
- (instancetype)initWithActivityItems:(NSArray<__kindof UIActivityItemProvider *> *)activityItems
                applicationActivities:(NSArray<__kindof UIActivity *> *)applicationActivities {
    if([activityItems count] > 1 || ![activityItems[0] isKindOfClass: [UIActivityItemProvider class]])
        return %orig;
    return %orig([NSArray arrayWithObjects:activityItems[0].item, nil], applicationActivities);
}
%end
