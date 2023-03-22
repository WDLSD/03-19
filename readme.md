# 精确线搜索方法

## 进退法  
forward_back_method.m   
输入: 目标函数 $\varphi(\alpha)$, 初始点 $\alpha_{0} \in [0, \infty],$ 初始步长 $\gamma_0$, 加倍系数 $t>1$ (一般取 $t=2$ ).   
输出: 目标函数 $\varphi(\alpha)$ 的搜索区间 $[a,b].$  
计算初始点 $\alpha_0$ 的函数值 $\varphi(\alpha_0).$  
对 $i=0,1,\ldots, $ 重复如下过程:  
1. 令 $\alpha_{i+1} = \alpha_i + \gamma_i,$ 并计算 $\varphi(\alpha_{i+1}).$
2. 若 $\varphi_{i+1} < \varphi(i),$ 则加大搜索步长: 令 $\gamma_{i+1} = t\gamma_{i},$ 并记 $\alpha = \alpha_i.$ 进行下一次迭代(即 $i = i+1$).
3. 若 $\varphi_{i+1} \geq \varphi(i),$ 则进行反向搜索或输出:  
    3.1. 若$i = 0$, 则令 $\gamma_1 = - \gamma_0, \alpha = \alpha_1, \alpha_1 = \alpha_0, \varphi_1 = \varphi_0,$ 进行下一次迭代   
    3.2. 若 $i \geq 1 ,$ 则令 $ a = {\rm min} \{ \alpha, \alpha_{i+1}\}$ 和 $ b = {\rm max} \{ \alpha, \alpha_{i+1}\}.$ 迭代停止, 返回 $a$ 和 $b$ 的值.

## 黄金分割法 
golden_section_method.m  
输入: 初始搜索区间 $[a,b]$, 缩短率 $\tau = 0.618,$ 目标函数 $\varphi(\alpha)$, 误差限 $ \epsilon.$   
输出: 近似极小点 $\alpha^*,$ 迭代次数 $i$, 误差限 $\tau^i(b - a).$   
初始过程: 记 $[a_0, b_0] = [a, b],$ 计算初始试探点:  
$$
    \alpha_0^l=a_0 + (1 - \tau)(b_0 - a_0), \qquad \alpha_0^r = a_0 + \tau(b_0 - a_0),
$$
及其对应的函数值 $\varphi(\alpha_0^l)$ 和 $\varphi(\alpha_0^r).$  
对于 $i = 0,1, \ldots,$ 重复如下过程:  
1. 若 $\varphi(\alpha_i^l) < \varphi(\alpha_i^r), $ 则 $[a_{i+1}, b_{i+1}] = [a_i, \alpha^r_i].$ 若$b_{i+1} - a_{i+1} < \epsilon, $ 则停止迭代, 返回; 否则可依次得到:  
    1.1. 新搜索区间中的新试探点: $\alpha_{i+1}^l = a_{i+1} + (1-\tau)(b_{i+1} - a_{i+1}), \alpha_{i+1}^r = \alpha_i^l.$
    1.2. 计算新试探点 $\alpha_{i+1}^l$ 的函数值 $\varphi(alpha_{i+1}^l)$ 及赋值 $\varphi(alpha_{\alpha_{i+1}^r}) = \varphi(\alpha_i^l)$.
2. 若 $\varphi(\alpha_i^l) \geq \varphi(\alpha_i^r), $ 则 $[a_{i+1}, b_{i+1}] = [\alpha_i^l, b_i].$ 若$b_{i+1} - a_{i+1} < \epsilon, $ 则停止迭代, 否则可依次得到:   
 $\alpha_{i+1}^l = \alpha_{i}^r, \quad a_{i+1} + \tau(b_{i+1} - a_{i+1}), \quad \varphi(\alpha_{i+1}^l) = \varphi(\alpha_i^r), \quad \varphi(\alpha_{i+1}^r).$

## 斐波那契法 
fibonacci_method.m

## 二分查找法 
binary_search_method.m

## 测试文件 
test.m

## 其他文件 
求斐波那契数列  fibonacci.m

测试函数        phi.m

求导文件        dphi.m
