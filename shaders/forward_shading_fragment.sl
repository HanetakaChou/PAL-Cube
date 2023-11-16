//
// Copyright (C) YuqiaoZhang(HanetakaChou)
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//

#include "forward_shading_pipeline_layout.sli"

pal_root_signature(forward_shading_root_signature_macro, forward_shading_root_signature_name)
pal_early_depth_stencil
pal_pixel_shader_parameter_begin(main)
pal_pixel_shader_parameter_in_position pal_pixel_shader_parameter_split
pal_pixel_shader_parameter_in(pal_float2, interpolated_uv, 0) pal_pixel_shader_parameter_split
pal_pixel_shader_parameter_out(pal_float4, out_color, 0)
pal_pixel_shader_parameter_end(main)
{
    out_color = pal_sample_2d(g_material_textures[0], g_samplers[0], interpolated_uv);
}