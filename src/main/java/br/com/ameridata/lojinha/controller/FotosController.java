package br.com.ameridata.lojinha.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.async.DeferredResult;
import org.springframework.web.multipart.MultipartFile;

import br.com.ameridata.lojinha.dto.FotoDTO;
import br.com.ameridata.lojinha.storage.FotoStorage;
import br.com.ameridata.lojinha.storage.FotoStorageRunnable;

@RestController
@RequestMapping("/fotos")
public class FotosController {

	@Autowired
	private FotoStorage fotoStorage;

	@PostMapping
	public DeferredResult<FotoDTO> upload(@RequestParam("files[]") MultipartFile[] files) {
		DeferredResult<FotoDTO> deferredResult = new DeferredResult<>();

		Thread thread = new Thread(new FotoStorageRunnable(files, deferredResult, fotoStorage));
		thread.start();

		return deferredResult;
	}

}