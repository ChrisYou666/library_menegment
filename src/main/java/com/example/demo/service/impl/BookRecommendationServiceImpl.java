package com.example.demo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.demo.commom.UserContext;
import com.example.demo.dto.BookRecommendationDTO;
import com.example.demo.entity.BookRecommendation;
import com.example.demo.mapper.BookRecommendationMapper;
import com.example.demo.service.BookRecommendationService;
import com.example.demo.vo.BookRecommendationVO;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BookRecommendationServiceImpl extends ServiceImpl<BookRecommendationMapper,BookRecommendation> implements BookRecommendationService {
    @Resource
    private BookRecommendationMapper mapper;
    private static final DateTimeFormatter FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    @Override
    public void create(BookRecommendationDTO dto) {
        BookRecommendation e = new BookRecommendation();
        BeanUtils.copyProperties(dto, e);
        Integer id= Math.toIntExact(UserContext.getUserId());
        e.setOperatorId(id);
        mapper.insert(e);
    }

    @Override
    public void update(BookRecommendationDTO dto) {
        BookRecommendation exists = mapper.selectById(dto.getId());
        if (exists == null) throw new RuntimeException("推荐不存在: " + dto.getId());
        BeanUtils.copyProperties(dto, exists);
        mapper.updateById(exists);
    }

    @Override
    public void delete(Integer id) {
        mapper.deleteById(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        mapper.deleteBatchIds(ids);
    }

    @Override
    public Page<BookRecommendationVO> page(int page, int size) {
        Page<BookRecommendation> p = mapper.selectPage(new Page<>(page, size), new QueryWrapper<>());

        Page<BookRecommendationVO> voPage = new Page<>(page, size, p.getTotal());
        List<BookRecommendationVO> voList = p.getRecords().stream().map(e -> {
            BookRecommendationVO vo = new BookRecommendationVO();
            BeanUtils.copyProperties(e, vo);
            return vo;
        }).collect(Collectors.toList());
        voPage.setRecords(voList);
        return voPage;
    }


    @Override
    public List<BookRecommendationVO> listByMonth(String month) {
        return mapper.selectByMonth(month).stream().map(this::toVO).collect(Collectors.toList());
    }

    @Override
    public List<BookRecommendationVO> current() {
        return mapper.selectCurrent().stream().map(this::toVO).collect(Collectors.toList());
    }

    @Override
    public List<BookRecommendationVO> listByBookId(Integer bookId) {
        return mapper.selectByBookId(bookId).stream().map(this::toVO).collect(Collectors.toList());
    }

    @Override
    public boolean existsMonth(String month) {
        return mapper.countByMonth(month) > 0;
    }

    @Override
    public List<String> listMonths() {
        return mapper.selectAllMonths();
    }

    @Override
    public void activate(Integer id) {
        mapper.updateById(new BookRecommendation() {{ setId(id); setStatus(1); }});
    }

    @Override
    public void deactivate(Integer id) {
        mapper.updateById(new BookRecommendation() {{ setId(id); setStatus(0); }});
    }

    @Override
    public void updateStatus(Integer id, Integer status) {
        mapper.updateById(new BookRecommendation() {{ setId(id); setStatus(status); }});
    }

    @Override
    public void batchUpdateStatus(List<Integer> ids, Integer status) {
        ids.forEach(id -> updateStatus(id, status));
    }

    @Override
    public BookRecommendationVO detail(Integer id) {
        return toVO(mapper.selectById(id));
    }

    @Override
    public List<BookRecommendationVO> popular(int topN) {
        // 简单示例：取最新的 topN 条启用的推荐
        return mapper.selectList(new QueryWrapper<BookRecommendation>()
                        .eq("status", 1)
                        .orderByDesc("create_time")
                        .last("LIMIT " + topN))
                .stream().map(this::toVO).collect(Collectors.toList());
    }

    @Override
    public Page<BookRecommendationVO> searchRecommendations(String keyword, int page, int size) {
        LambdaQueryWrapper<BookRecommendation> wrapper = new LambdaQueryWrapper<>();

        if (StringUtils.isNotBlank(keyword)) {
            wrapper.and(w -> {
                w.like(BookRecommendation::getRecommendReason, keyword)
                        .or().like(BookRecommendation::getRecommendMonth, keyword);

                if (keyword.matches("\\d+")) {
                    w.or().eq(BookRecommendation::getBookId, Integer.valueOf(keyword));
                }
            });
        }

        wrapper.orderByDesc(BookRecommendation::getId);

        Page<BookRecommendation> entityPage = new Page<>(page, size);
        this.page(entityPage, wrapper);

        Page<BookRecommendationVO> voPage = new Page<>(page, size, entityPage.getTotal());
        voPage.setRecords(entityPage.getRecords().stream()
                .map(this::toVO)
                .collect(Collectors.toList()));

        return voPage;
    }

    private BookRecommendationVO toVO(BookRecommendation e) {
        BookRecommendationVO vo = new BookRecommendationVO();
        BeanUtils.copyProperties(e, vo);
        vo.setCreateTime(e.getCreateTime().format(FMT));
        vo.setUpdateTime(e.getUpdateTime().format(FMT));
        return vo;
    }
}