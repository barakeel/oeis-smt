;; sequence(s): A170781
;; terms: 0 1 65664 64573362 8589967360 381469921875 8463330562176 116315259876004 1125899915231232 8338590871356645 50000000050000000 252723514356826326 1109305553585209344 4325207960098534327
;; small program: ((loop(x * x, 2 + 2, x) * x) + loop(x * x, 2, x * x)) div 2
;; fast program: ((loop((1 + ((x * x) * x)) * (x * x), 1, (x * x) * x) div 2) * x) * x
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f2 (Int) Int)
(declare-fun g2 () Int)
(declare-fun h2 (Int) Int)
(declare-fun u2 (Int Int) Int)
(declare-fun v2 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* x x))))
(assert (= g0 (+ 2 2)))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (f1 x) (* x x))))
(assert (= g1 2))
(assert (forall ((x Int)) (= (h1 x) (* x x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (small x) (divf (+ (* (v0 x) x) (v1 x)) 2))))
(assert (forall ((x Int)) (= (f2 x) (* (+ 1 (* (* x x) x)) (* x x)))))
(assert (= g2 1))
(assert (forall ((x Int)) (= (h2 x) (* (* x x) x))))
(assert (forall ((x Int) (y Int)) (= (u2 x y) (ite (<= x 0) y (f2 (u2 (- x 1) y))))))
(assert (forall ((x Int)) (= (v2 x) (u2 g2 (h2 x)))))
(assert (forall ((x Int)) (= (fast x) (* (* (divf (v2 x) 2) x) x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
