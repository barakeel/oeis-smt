;; sequence(s): A37599
;; terms: 1 9 54 325 1953 11718 70309 421857 2531142 15186853 91121121 546726726 3280360357 19682162145 118092972870 708557837221 4251347023329 25508082139974 153048492839845 918290957039073
;; small program: loop((1 + 2) * (((((x div 2) div 2) mod 2) + x) + x), x, 1 + 2) div 2
;; fast program: (loop((2 * ((x + x) + x)) + (if (y mod (1 + 2)) <= 0 then 1 else 0), x, 1) * (1 + 2)) div 2
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (+ 1 2) (+ (+ (modf (divf (divf x 2) 2) 2) x) x)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 (+ 1 2)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) 2))))
(assert (forall ((x Int) (y Int)) (= (f1 x y) (+ (* 2 (+ (+ x x) x)) (ite (<= (modf y (+ 1 2)) 0) 1 0)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (divf (* (v1 x) (+ 1 2)) 2))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
