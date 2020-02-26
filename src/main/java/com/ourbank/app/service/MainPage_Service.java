package com.ourbank.app.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ourbank.app.bean.BestBoard_Bean;
import com.ourbank.app.bean.DepositBoard_Bean;
import com.ourbank.app.bean.FreeBoard_Bean;
import com.ourbank.app.bean.NewnoticeBoard_Bean;
import com.ourbank.app.mapper.MainPage_Mapper;

@Component
public class MainPage_Service {

	@Autowired
	private MainPage_Mapper boardMapper;
	
	public ArrayList<NewnoticeBoard_Bean> selectNewNotice() {
		
		return this.boardMapper.selectNotice();
	}
	
	
	public ArrayList<BestBoard_Bean> selectBest(){
		return this.boardMapper.selectBest();
	}
	
	public DepositBoard_Bean bestDeposit() {
	      return this.boardMapper.bestDeposit();
	   }

	///////////////////////////////////////////////////////////////////////
	//�˻��� �� ��
	public int getTotalCntBySubject(String search) {
		int nCnt = 0;
		nCnt = this.boardMapper.getTotalCntBySubject(search);
		return nCnt;
	}

	//�˻��ϱ� -> �۸�� ArrayList
	public ArrayList<FreeBoard_Bean> getSearchedList(int nStartPage, int list_num, String strSearchThis) {
		return this.boardMapper.getSearchedList(nStartPage, list_num, strSearchThis);
	}

	//�˻��ϱ� - �ۺ���
	public FreeBoard_Bean getSpecificRow(int board_idx) {
		return this.boardMapper.getSpecificRow(board_idx);
	}
	
	////��ȸ�� �ø���
	//����Խ���
	public void updateReviewHits(int hits, int best_idx) {
		System.out.println("��ȸ�� �ö�");
		this.boardMapper.updateReviewHits(hits, best_idx);
	}
	//�����Խ��� 
	public void updateFreeHits(int hits, int best_idx) {
		System.out.println("�����Խ��� ��ȸ�� �ö�");
		this.boardMapper.updateFreeHits(hits, best_idx);
	}
	//���ӹ�Խ��� 
	public void updateMeetingHits(int hits, int best_idx) {
		System.out.println(" ���ӹ�Խ���  ��ȸ�� �ö�");
		this.boardMapper.updateMeetingHits(hits, best_idx);
	}
	//��й�Խ��� 
	public void updateDebateHits(int hits, int best_idx) {
		System.out.println(" ��й�Խ���  ��ȸ�� �ö�");
		this.boardMapper.updateDebateHits(hits, best_idx);
	}
	//����ũ���Ͽ�Խ��� 
	public void updateInvestHits(int hits, int best_idx) {
		System.out.println("����ũ���Ͽ�Խ���  ��ȸ�� �ö�");
		this.boardMapper.updateInvestHits(hits, best_idx);
	}
	//QnA�Խ��� 
	public void updateQnaHits(int hits, int best_idx) {
		System.out.println("QnA�Խ��� ��ȸ�� �ö�");
		this.boardMapper.updateQnaHits(hits, best_idx);
	}
	//FAQ�Խ��� 
	public void updateFaqHits(int hits, int best_idx) {
		System.out.println("FAQ�Խ���  ��ȸ�� �ö�");
		this.boardMapper.updateFaqHits(hits, best_idx);
	}
	//���ô����Խ��� 
	public void updateNewsHits(int hits, int best_idx) {
		System.out.println("���ô����Խ��� ��ȸ�� �ö�");
		this.boardMapper.updateNewstHits(hits, best_idx);
	}
	//�������װԽ��� 
	public void updateNewnoticeHits(int hits, int best_idx) {
		System.out.println("�������װԽ���  ��ȸ�� �ö�");
		this.boardMapper.updateNewnoticeHits(hits, best_idx);
	}
}
