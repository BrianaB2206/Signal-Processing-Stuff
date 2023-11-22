## Copyright (C) 2020 Briana
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} func (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Briana <Briana@DESKTOP-DI5K6A7>
## Created: 2020-11-14

function [w] = func (t, T)
  for i=1:length(t)
    w(i)=exp((-mod(t(i),T))/T);
  endfor
endfunction
