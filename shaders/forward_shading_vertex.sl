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
pal_vertex_shader_parameter_begin(main)
pal_vertex_shader_parameter_in(pal_float3, vertex_input_position, 0) pal_vertex_shader_parameter_split
pal_vertex_shader_parameter_in(pal_float2, vertex_input_uv, 1) pal_vertex_shader_parameter_split
pal_vertex_shader_parameter_out_position pal_vertex_shader_parameter_split
pal_vertex_shader_parameter_out(pal_float2, vertex_output_uv, 0)
pal_vertex_shader_parameter_end(main)
{
    pal_position = pal_mul(projection_transform, pal_mul(view_transform, pal_mul(model_transform, pal_float4(vertex_input_position, 1.0))));
    vertex_output_uv = vertex_input_uv;
}

