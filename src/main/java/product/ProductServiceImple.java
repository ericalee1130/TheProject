package product;

import java.sql.Timestamp;
import java.util.concurrent.TimeUnit;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImple implements ProductService{

	@Autowired
	ProductDao dao;

	@Override
	public List<ProductVo> selectList(ProductVo vo) {
		List<ProductVo> list = dao.selectList(vo);
		
		Long datetime = System.currentTimeMillis();
        Timestamp now = new Timestamp(datetime);
        long diff;
        long hours;
        System.out.println("service i : "+list.size());
        for (int i = 0; i < list.size(); i++) {
           diff = list.get(i).getEndtime().getTime()-now.getTime();
           hours = TimeUnit.MILLISECONDS.toMinutes(diff)/60; 
           list.get(i).setTimeleft(hours);
          // System.out.println(list.get(i).getTimeleft());
           if (list.get(i).getTimeleft() >= 24) {
	            list.get(i).setTimeleft_str(String.valueOf((list.get(i).getTimeleft())/24) + " days");
	         	//System.out.println(list.get(i).getTimeleft_str());
           }
           else {
        	   list.get(i).setTimeleft_str(String.valueOf(list.get(i).getTimeleft()) + " hrs");
           }
        }
        return list;
	}
	@Override
	public ProductVo view(String itemid) {
		ProductVo pv = dao.selectOne(itemid);
		String s = pv.getPictures().substring(2, pv.getPictures().length()-2);
		pv.setPicturesList(s.toString().split("\", \""));
		return pv;
	}
	@Override
	public int count(ProductVo vo) {
		return dao.count(vo);
	}

	@Override
	public int delete(String productid) {
		return dao.delete(productid);
	}
	@Override
	public List<ProductVo> selectAll(ProductVo vo) {
		List<ProductVo> list = dao.selectAll(vo);
		
		Long datetime = System.currentTimeMillis();
        Timestamp now = new Timestamp(datetime);
        long diff;
        long hours;
        System.out.println("service i : "+list.size());
        for (int i = 0; i < list.size(); i++) {
           diff = list.get(i).getEndtime().getTime()-now.getTime();
           hours = TimeUnit.MILLISECONDS.toMinutes(diff)/60; 
           list.get(i).setTimeleft(hours);
          // System.out.println(list.get(i).getTimeleft());
           if (list.get(i).getTimeleft() >= 24) {
	            list.get(i).setTimeleft_str(String.valueOf((list.get(i).getTimeleft())/24) + " days");
	         	//System.out.println(list.get(i).getTimeleft_str());
           }
           else {
        	   list.get(i).setTimeleft_str(String.valueOf(list.get(i).getTimeleft()) + " hrs");
           }
        }
        System.out.println(list);
        return list;

	}
	@Override
	public List<String> selectPCList() {
		return dao.selectPCList();
	}
	@Override
	public List<String> selectSCList(String primary_category) {
		return dao.selectSCList(primary_category);
	}
}
