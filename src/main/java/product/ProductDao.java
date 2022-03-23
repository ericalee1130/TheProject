package product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {

	@Autowired
	private SqlSessionTemplate sst;

	public List<ProductVo> selectList(ProductVo vo) {
		return sst.selectList("product.selectList", vo);
	}
	
	public List<String> selectPCList() {
		return sst.selectList("product.selectPrimaryCategory");
	}
	
	public List<String> selectSCList(String primary_category) {
		return sst.selectList("product.selectSecondaryCategory");
	}
	
	public ProductVo selectOne(String itemid) {
		return sst.selectOne("product.selectOne", itemid);
	}
	
	public int count(ProductVo vo) {
		return sst.selectOne("product.count",vo);
	}
	
	public ProductVo category(String primary_category) {
		return sst.selectOne("product.category", primary_category);
	}
	public int delete(String productid) {
		return sst.delete("product.delete", productid);
	}
	public List<ProductVo> selectAll(ProductVo vo) {
		return sst.selectList("product.selectAll",vo);
	}
	
}
