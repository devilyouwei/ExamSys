package cn.cslg.exam.service;

import java.util.List;

import cn.cslg.exam.dao.BaseDAO;

public class QService {

	@SuppressWarnings("rawtypes")
	public static List doFind(BaseDAO dao, int limit) {
		// 获取题库总数
		int count = dao.count();
		// 如果选的题目比题库多，则返回整个题库
		if (limit >= count) {
			return dao.findAll();
		}

		// 随机数从1到count+1
		// 此处count+1是因为随机数取不到最大数
		int[] randId = randomId(1, count, limit);

		if (randId == null)
			return null;
		else {
			return dao.findByRandId(randId);
		}

	}

	// 生成随机数（无重复）
	private static int[] randomId(int min, int max, int n) {
		if (n > (max - min + 1) || max < min) {
			return null;
		}
		int[] result = new int[n];
		int count = 0;
		while (count < n) {
			int num = (int) (Math.random() * (max - min + 1)) + min;
			boolean flag = true;
			for (int j = 0; j < n; j++) {
				if (num == result[j]) {
					flag = false;
					break;
				}
			}
			if (flag) {
				result[count] = num;
				count++;
			}
		}
		return result;
	}

}
