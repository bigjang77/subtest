package site.metacoding.miniproject.service;

import java.util.List;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import site.metacoding.miniproject.domain.intro.Intro;
import site.metacoding.miniproject.domain.intro.IntroDao;
import site.metacoding.miniproject.domain.subscribe.Subscribe;
import site.metacoding.miniproject.domain.subscribe.SubscribeDao;
import site.metacoding.miniproject.web.dto.request.intro.DetailDto;
import site.metacoding.miniproject.web.dto.request.intro.UpdateDto;

@RequiredArgsConstructor
@Service
public class IntroService {

    private final IntroDao introDao;
    private final SubscribeDao subscribeDao;

    public List<Intro> 기업소개목록보기() {
        return introDao.findAll();
    }

    public DetailDto 기업소개상세보기(Integer companyId, Integer principalId) {
        return introDao.findByDetail(companyId, principalId);
    }

    public void 기업소개수정하기(Integer companyId, UpdateDto updateDto) {
        Intro introPS = introDao.findById(companyId);
        introPS.Update(updateDto);
        introDao.update(introPS);
    }

    public Subscribe 구독하기(Subscribe subscribe) {
        subscribeDao.insert(subscribe);
        return subscribe;
    }

    public void 구독취소하기(Integer subscribeId) {
        subscribeDao.deleteById(subscribeId);
    }

    public Intro 기업소개수정상세보기(Integer companyId) {
        return introDao.findById(companyId);
    }
}