package com.project.dang.dto;



import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data  @NoArgsConstructor @AllArgsConstructor @Builder
public class PlaceListRequestDto {

private String type,keyword;
	@ToString.Include
	public boolean isSearch() {
		return type != null && keyword != null;
	}
	
	//현재 페이지 번호(없을 경우 1로 설정)
	private int p = 1;
	private int size = 5;
	 @ToString.Include
	public int startRow() {
		return endRow() - (size - 1);
	}
	 @ToString.Include
	public int endRow() {
		return p * size;
	}
	
	//총 게시글 수
	private int count;

	//화면에 표시할 블럭 개수
	private int blockSize = 5;
	
	 @ToString.Include
	public int pageCount() {
		return (count + size - 1) / size;
	}
	 @ToString.Include
	public int startBlock() {
		return (p - 1) / blockSize * blockSize + 1;
	}
	
	 @ToString.Include
	public int endBlock() {
		int value = startBlock() + blockSize - 1;
		return Math.min(value, lastBlock());
	}
	 @ToString.Include
	public int prevBlock() {
		return startBlock() - 1;
	}
	 @ToString.Include
	public int nextBlock() {
		return endBlock() + 1;
	}
	 @ToString.Include
	public int firstBlock() {
		return 1;
	}
	 @ToString.Include
	public int lastBlock() {
		return pageCount();
	}
	 @ToString.Include
	public boolean isFirst() {
		return p == 1;
	}
	 @ToString.Include
	public boolean isLast() {
		return endBlock() == lastBlock();
	}
	 @ToString.Include
	public boolean hasPrev() {
		return startBlock() > 1;
	}
	 @ToString.Include
	public boolean hasNext() {
		return endBlock() < lastBlock();
	}
	
	//검색이나 크기 등이 유지될 수 있도록 Query String을 생성
		//- p를 제외한 나머지 항목들에 대한 파라미터 생성
		public String parameter() {
			if(isSearch()) {
				return "size="+size+"&type="+type+"&keyword="+keyword;
			}
			else {
				return "size="+size;
			}
			
		}
}
