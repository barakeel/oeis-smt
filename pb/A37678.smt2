;; sequence(s): A37678
;; terms: 1 8 66 531 4249 33992 271938 2175507 17404057 139232456 1113859650 8910877203 71287017625 570296141000 4562369128002 36498953024019 291991624192153 2335932993537224 18687463948297794 149499711586382355
;; small program: loop((2 + (2 * ((2 * ((x div 2) + x)) + x))) + ((x div 2) mod 2), x, 1)
;; fast program: loop((2 * (2 + ((2 * ((x div 2) + x)) + x))) - (if (x mod (1 + 2)) <= 0 then 1 else 2), x, 1)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun f0 (Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 (Int) Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (+ 2 (* 2 (+ (* 2 (+ (divf x 2) x)) x))) (modf (divf x 2) 2)))))
(assert (forall ((x Int)) (= (g0 x) x)))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) h0))))
(assert (forall ((x Int)) (= (small x) (v0 x))))
(assert (forall ((x Int)) (= (f1 x) (- (* 2 (+ 2 (+ (* 2 (+ (divf x 2) x)) x))) (ite (<= (modf x (+ 1 2)) 0) 1 2)))))
(assert (forall ((x Int)) (= (g1 x) x)))
(assert (= h1 1))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 (g1 x) h1))))
(assert (forall ((x Int)) (= (fast x) (v1 x))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
