import { TestBed, inject } from '@angular/core/testing';

import { PicService } from './pic.service';

describe('PicService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [PicService]
    });
  });

  it('should be created', inject([PicService], (service: PicService) => {
    expect(service).toBeTruthy();
  }));
});
