<?php

class ControllerModuleSync1C extends Controller {

	private $error = array();

	public function index() {
		$data = array();

		$data['lang'] = $this->load->language('module/sync_1c');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['header'] = $this->load->controller('common/header');
		$data['footer'] = $this->load->controller('common/footer');

		$data['breadcrumbs'] = $this->get_breadcrumbs();

		$this->response->setOutput($this->load->view('module/sync_1c.tpl', $data));
	}


	public function import() {

	}

	private function get_breadcrumbs() {
		return array(
			array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			),
			array(
				'text' => $this->language->get('text_module'),
				'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
			),
			array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/sync_1c', 'token=' . $this->session->data['token'], 'SSL')
			)
		);
	}

}
