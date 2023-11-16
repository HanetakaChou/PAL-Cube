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

#ifndef _DEMO_H_
#define _DEMO_H_ 1

#include "../thirdparty/PAL/include/pal_device.h"
#include <vector>

class Demo
{
	pal_pipeline_layout *m_forward_shading_pipeline_layout;

	pal_render_pass *m_forward_shading_render_pass;
	pal_graphics_pipeline *m_forward_shading_pipeline;

	pal_descriptor_set *m_global_descriptor_set;

	pal_sampler *m_cube_emissive_texture_sampler;
	pal_asset_vertex_position_buffer *m_cube_vertex_position_buffer;
	pal_asset_vertex_varying_buffer *m_cube_vertex_varying_buffer;
	pal_asset_index_buffer *m_cube_index_buffer;
	pal_asset_sampled_image *m_cube_emissive_texture;

	pal_descriptor_set *m_cube_material_set;

	float m_cube_spin_angle;

	PAL_COLOR_ATTACHMENT_IMAGE_FORMAT m_swap_chain_image_format;
	uint32_t m_swap_chain_image_width;
	uint32_t m_swap_chain_image_height;
	pal_depth_stencil_attachment_image *m_depth_stencil_attachment_image;
	uint32_t m_swap_chain_image_count;
	pal_frame_buffer **m_frame_buffers;

	void create_render_pass_and_pipeline(pal_device const *device);
	void destroy_render_pass_and_pipeline(pal_device const *device);

public:
	Demo();

	void init(pal_device *device, pal_upload_ring_buffer const *global_upload_ring_buffer);
	void destroy(pal_device *device);

	void attach_swap_chain(pal_device const *device, pal_swap_chain const *swap_chain);
	void dettach_swap_chain(pal_device const *device, pal_swap_chain const *swap_chain);

	void draw(pal_graphics_command_buffer *command_buffer, uint32_t swap_chain_image_index, void *upload_ring_buffer_base, uint32_t upload_ring_buffer_current, uint32_t upload_ring_buffer_end, uint32_t upload_ring_buffer_offset_alignment);
};

#endif