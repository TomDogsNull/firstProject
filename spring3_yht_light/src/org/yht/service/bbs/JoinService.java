package org.yht.service.bbs;

import java.util.List;

import org.yht.domain.test01.JoinVo;
import org.yht.domain.test01.MemberVo;

public interface JoinService {
	
	public boolean joinInsert(JoinVo vo);
	public JoinVo getJoin(JoinVo vo);
	public boolean joinDel(JoinVo vo);
	public boolean join_cnt(JoinVo vo);
	public List<JoinVo> food_joinlist(int food_seq);
	public MemberVo showMemberInfo(String id);
}
